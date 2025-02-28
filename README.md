# Linux_Server

### 1. Buy Server from Contabo

It is a Cloud VPS 4C,
4 vCPU Cores
4 GB RAM
100 GB NVMe
or 200 GB SSD
1 Snapshot
32 TB Traffic*
Unlimited Incoming

---

### 2. Start usin WSL localy

Run terminal, from command line use: `wsl`, using `wsl` is all so what we use to start marchin later. 

Use command `wsl -d Ubuntu` to select what operatin system I want the machine to use. 

If you want to use another distro use `wsl -d <distro>` **distro** use the (specify distro) you want to use.

Command:
`wsl`

Description: 
Start WSL default distro

Options:
-d <distro> (specify distro)

Examples:
`wsl -d Ubuntu`

To install we use the command: `wsl --install -d ubuntu`.

Description: 
Install WSL with a specified distro


---

### 3. Now we try and simplify SSH connectivity with server.

Insted of running command: `ssh root@<IP>`, **IP** apply ip from contabo, we change a file that is stored localy in wsl, it is called the host file.

The file is stored  `/etc/hosts` we use `nano /etc/hosts` to open file. Add the following there`<IP> myserver`. Save and Exit, Press CTRL+O (Write Out), Press Enter (Confirm Save) and Press CTRL+X (Exit nano). 

Now we can connect with server using `myserver`.

```
ssh root@myserver
```

---

### 5. Next set up fire wall with UFW

UFW is all ready installed but not activ, running `sudo ufw status` result in the outcome: `Status: inactive`.

If you need to install the UFW we can use`sudo apt install ufw`

Now in the setup stage for UFW I use,

1. ```sudo ufw default allow outgoing```
2. ```sudo ufw default deny incoming```
3. ```sudo ufw allow ssh```																							
4. ```sudo ufw enable```																			
5. ```sudo reboot```

Next for the assigment is as well add port to allow connection over http then add VNC usin the port contabo provides. 

To add remaning rules is SSH back to server and include:

6. ```sudo ufw allow http```																					
7. ```sudo ufw allow <port>/tcp``` **port** use youre portumber.
8. ```sudo reboot```

---

#### 1. Extra 

We can proboly make a script like "setup_ufw.sh"

example code is in: Executable Scripts/setup_ufw.sh

Command to use,

1. Create script file:
```touch setup_ufw.sh```

2. Add neccesary permissions
```chmod 744 setup_ufw.sh```

3. open file to inclode the code from "Scripts/setup_ufw.sh"
```nano setup_ufw.sh```
- Save and Exit
- Press CTRL+O (Write Out)
- Press Enter (Confirm Save)
- Press CTRL+X (Exit nano)

4. Execute the script to configure UFW:
```./setup_ufw.sh```

---



