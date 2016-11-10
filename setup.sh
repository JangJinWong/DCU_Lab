BASEDIR=$(cd $(dirname "$1") && pwd -P)/$(basename "$1")
BASHRC="${HOME}/.bashrc"

# Set Gazebo Path
PLUGIN_PATH="${BASEDIR}Firmware/Tools/sitl_gazebo/Build"
if !(echo "$GAZEBO_PLUGIN_PATH" | grep -q "${PLUGIN_PATH}"); then
  echo "" >> "$BASHRC"
  echo "# Set Gazebo Plugin Path" >> "$BASHRC"
  echo "export GAZEBO_PLUGIN_PATH=\${GAZEBO_PLUGIN_PATH}:${PLUGIN_PATH}" >> "$BASHRC"
fi

MODELS_PATH="${BASEDIR}Firmware/Tools/sitl_gazebo/models"
CUSTOM_MODELS_PATH="${BASEDIR}gazebo_models"
if !(echo "$GAZEBO_MODEL_PATH" | grep -q "${MODELS_PATH}"); then
  echo "" >> "$BASHRC"
  echo "# Set Gazebo Model Path" >> "$BASHRC"
  echo "export GAZEBO_MODEL_PATH=\${GAZEBO_MODEL_PATH}:${MODELS_PATH}" >> "$BASHRC"
  if !(echo "$GAZEBO_MODEL_PATH" | grep -q "${CUSTOM_MODELS_PATH}"); then
    echo "export GAZEBO_MODEL_PATH=\${GAZEBO_MODEL_PATH}:${CUSTOM_MODELS_PATH}" >> "$BASHRC"
  fi
fi

# Set ROS Indigo
SETUP="source ${BASEDIR}catkin/devel/setup.bash"
if !(grep -q "$SETUP" "$BASHRC"); then
  echo "" >> "$BASHRC"
  echo "# Set ROS Indigo" >> "$BASHRC"
  echo "${SETUP}" >> "$BASHRC"
fi

. ${BASHRC}
