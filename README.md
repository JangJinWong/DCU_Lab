# DCU Lab

## Dependencies
opencv 2.0~  
ros-indigo

## Installation
git submodule init  
git submodule update  

cd path_to_project_root/Firmware; make  
mkdir ./Tools/sitl_gazebo/Build  
cd ./Tools/sitl_gazebo/Build  
cmake ..; make  
  
sh setup.sh  
