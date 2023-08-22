# locosim_jupyter

This repository is a customized setup based on [locosim](https://github.com/mfocchi/locosim) and [lab-docker](https://github.com/mfocchi/lab-docker) projects. It utilizes configurations from [docker-stuffs](https://github.com/lomcin/docker-stuffs) and [linux-stuffs](https://github.com/lomcin/linux-stuffs) repositories.

## Install and Run Locosim Jupyter

1. Clone this repository and run `prepare.sh`:
    ```bash
    git clone https://github.com/gbrlb/locosim_jupyter.git
    cd locosim_jupyter
    ./prepare.sh
    ```

2. Install Docker:
   - **Linux**:
     ```bash
     curl -fsSL https://raw.githubusercontent.com/lomcin/linux-stuffs/master/install/docker -o install_docker.sh
     sudo sh ./install_docker.sh
     ```
   - **Windows**:
     1. Install Windows Subsystem for Linux (WSL) by following the [Install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install) instructions.
     2. Install Docker by following the [Turn on Docker Desktop WSL 2](https://docs.docker.com/desktop/wsl/#turn-on-docker-desktop-wsl-2) instructions.

### Usage

1. Run Docker:
    - **Linux**:
      ```bash
      ./run_linux.sh
      ```
    - **Windows WSL**:
      ```bash
      sudo ufw allow 8888
      sudo ufw enable
      ./run_wsl.sh
      ```

2. Inside the Docker container, execute:
    ```bash
    lab
    ```

3. Access the Jupyter Lab interface by opening http://localhost:8888/ in a web browser.

4. Password Token for Jupyter Lab: `locosim`

5. Inside Jupyter Lab, navigate to `robot_control/lab_exercises/L1_kinematics.ipynb` for the relevant exercise.