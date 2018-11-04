# respeaker-ros-docker

Docker image containing the ROS bindings for the
[Seeed ReSpeaker Mic Array v2.0](http://wiki.seeedstudio.com/ReSpeaker_Mic_Array_v2.0/)
device.

## How to run the microphone array drivers

### 1. Build the image

Run the following command from the root directory of this repository
to build the Docker image
```
docker build -t ripl/respeaker-array-ros ./
```

### 2. Run the drivers using the ROS launch file

Run the following command to run the drivers using the ROS
launch file.
```
docker run -it --net=host --privileged ripl/respeaker-array-ros roslaunch respeaker_ros respeaker.launch
```

### 3. (Advanced) Run the drivers using a `libbot2` deputy

Run the following command to launch a `liboot2` deputy that is responsible
for running/stopping/monitoring the drivers on behalf of a `liboot2` sheriff
process.
```
docker run -it --net=host --privileged ripl/respeaker-array-ros bot-procman-deputy --name <deputy_name>
```
where `<deputy_name>` can be any string that identifies the camera
(e.g., `respeaker_mic_array`).

The deputy will have access to ROS and all the necessary packages. This means
that you can simply use the command `roslaunch respeaker_ros respeaker.launch`
in your procman configuration. Check out the file `samples/procman.cfg` for
an example of procman configuration file that activates a respeaker microphone
array.
