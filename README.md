# locosim jupyter
This repository is based on [locosim](https://github.com/mfocchi/locosim) and [lab-docker](https://github.com/mfocchi/lab-docker).
The docker configurations are based on [docker-stuffs](https://github.com/lomcin/docker-stuffs) and [linux-stuffs](https://github.com/lomcin/linux-stuffs).

## Install and Run Locosim Jupyter

1. Clone this repository
```
git clone https://github.com/gbrlb/locosim_jupyter.git
cd locosim_jupyter
./prepare.sh
```

2. Install Docker
	- Linux 
		```
		curl -fsSL https://raw.githubusercontent.com/lomcin/linux-stuffs/master/install/docker -o install_docker.sh
		sudo sh ./install_docker.sh
		```
	- Windows
		1. Windows Subsystem for Linux (WSL) following the [Install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install) instructions.
		2. Install docker following the [Turn on Docker Desktop WSL 2](https://docs.docker.com/desktop/wsl/#turn-on-docker-desktop-wsl-2) instructions.


###  Usage
1. Run docker with:
	- Linux
		```
		./run_linux.sh
		```
	
	- Windows WSL
		```
		./run_wsl 
		```

2. inside docker run `lab`
4. follow the link http://localhost:8888/
5. password `locosim`
6. inside jupyter lab go to `robot_control/lab_exercises/L1_kinematics.ipynb`
