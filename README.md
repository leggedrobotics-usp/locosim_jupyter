# locosim_jupyter

This repository is a customized setup based on [locosim](https://github.com/mfocchi/locosim) and [lab-docker](https://github.com/mfocchi/lab-docker) projects. It utilizes configurations from [docker-stuffs](https://github.com/lomcin/docker-stuffs) and [linux-stuffs](https://github.com/lomcin/linux-stuffs) repositories.

## Install and Run Locosim Jupyter


1. Install Docker:
   - **Linux**:
     ```bash
     curl -fsSL https://raw.githubusercontent.com/lomcin/linux-stuffs/master/install/docker -o install_docker.sh
     chmod +x install_docker.sh
     ./install_docker.sh
     ```

     - To use NVIDIA GPUs, follow the instructions provided in **[Installing the NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)**

   - **Windows**:
     1. Install Windows Subsystem for Linux (WSL) by following the [Install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install) instructions.
     2. Install Docker by following the [Turn on Docker Desktop WSL 2](https://docs.docker.com/desktop/wsl/#turn-on-docker-desktop-wsl-2) instructions.
     3. Launch Docker Desktop.
     4. Launch WSL.
     5. To navigate to the home directory in WSL, simply run: `cd ~`
     6. Open port:
        ```shell
        sudo ufw allow 8888
        sudo ufw enable
        ```

2. Clone this repository and run `prepare.sh`:
    ```bash
    git clone https://github.com/gbrlb/locosim_jupyter.git
    cd locosim_jupyter
    ./prepare.sh
    ```

### Usage

1. In a terminal, navigate to `locosim_jupyter`, if it is in the home directory:
   ```
   cd ~/locosim_jupyter
   ```

2. Run Docker with:
    - **Linux**:
      ```shell
      ./run_linux.sh
      ```

    - **Linux+gpu**: You need to have NVIDIA drivers and the NVIDIA Container Toolkit installed already.
      ```shell
      ./run_linux_gpu.sh
      ```

    - **Windows WSL**:
      ```shell
      ./run_wsl.sh
      ```

3. Inside the Docker container, execute:
    ```bash
    lab
    ```

4. Access the Jupyter Lab interface by opening http://localhost:8888/ in a web browser.

5. Password Token for Jupyter Lab: `locosim`

6. In the Jupyter Lab, navigate to [L1_kinematics.ipynb](http://localhost:8888/lab/tree/robot_control/lab_exercises/L1_kinematics.ipynb) located at `robot_control/lab_exercises/` to access the example exercise.

