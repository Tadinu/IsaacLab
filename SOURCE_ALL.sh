source /opt/ros/humble/setup.bash
printenv ROS_DISTRO
# (ROS1) rosversion -d
source install/setup.bash
python -c "import rclpy"
