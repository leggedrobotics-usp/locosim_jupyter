export PATH=/opt/openrobots/bin:$PATH
export LOCOSIM_DIR=$HOME/ros_ws/src/locosim
export PYTHONPATH=/opt/openrobots/lib/python3.8/site-packages:$LOCOSIM_DIR/robot_control:$PYTHONPATH

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/opt/openrobots/share/

export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
export PATH="$HOME/.local/bin:$PATH"

FILE=$HOME/ros_ws/devel/setup.bash
if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist."
    source /opt/ros/noetic/setup.bash
    cd $HOME/ros_ws
    catkin build
    echo "finish build"
fi

source /opt/ros/noetic/setup.bash
source $FILE
cd $LOCOSIM_DIR

export JUPYTER_ENABLE_LAB='yes'
export JUPYTER_TOKEN='locosim'
alias lab='jupyter lab --notebook-dir $LOCOSIM_DIR --no-browser'