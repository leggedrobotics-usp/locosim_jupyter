FROM mfocchi/trento_lab_framework@sha256:ef11accaab066aecf71515a3eaca1308ce48bb81445ffba104602dd4b054a11c

# Switch to root for system installs
USER root

# -------------------------
# 1. Upgrade pip + essentials
# -------------------------
RUN pip3 install --no-cache-dir --upgrade pip typing_extensions

# -------------------------
# 2. Install ROS Noetic tools
# -------------------------
RUN rm -f /etc/apt/trusted.gpg.d/ros.gpg || true \
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc \
       | gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
       http://packages.ros.org/ros/ubuntu focal main" \
       > /etc/apt/sources.list.d/ros-latest.list \
    && apt-get update \
    && apt-get install -y \
       ros-noetic-rqt \
       ros-noetic-rqt-common-plugins \
       ros-noetic-rqt-robot-plugins \
       ros-noetic-rqt-controller-manager \
       ros-noetic-rqt-multiplot \
    && rm -rf /var/lib/apt/lists/*

# -------------------------
# 3. Remove conflicting Ubuntu Jupyter
# -------------------------
RUN apt-get remove -y python3-jupyter-core jupyter-core || true

# -------------------------
# 4. Install JupyterLab cleanly
# -------------------------
RUN pip3 install --no-cache-dir --upgrade --ignore-installed \
    jupyterlab \
    notebook \
    ipykernel \
    jupyter-core \
    jupyter-client \
    psutil

RUN pip3 uninstall -y psutil \
    && rm -rf /usr/local/lib/python3.8/dist-packages/psutil* \
    && pip3 install --no-cache-dir --upgrade --ignore-installed \
       jupyterlab notebook ipykernel jupyter-core jupyter-client psutil

# -------------------------
# 5. Ensure kernel is registered
# -------------------------
RUN python3 -m ipykernel install --user

# -------------------------
# 6. (Optional) Drop privileges
# -------------------------
# If you want to run as non-root:
# ARG NB_UID=1000
# RUN useradd -m -u ${NB_UID} labuser
# USER labuser