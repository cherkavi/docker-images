# Start Android locally as Docker image
## [android original docker image](https://hub.docker.com/r/androidsdk/android-31)
> https://github.com/google/android-emulator-container-scripts
```sh
# docker run -it --rm --device /dev/kvm androidsdk/android-31:latest bash
docker run -it --rm --network host --device /dev/kvm androidsdk/android-31:latest bash

# check installed packages
sdkmanager --list
# create and run emulator
avdmanager create avd -n first_avd --abi google_apis/x86_64 -k "system-images;android-31;google_apis;x86_64"
emulator -avd first_avd -no-window -no-audio &
# 127.0.0.1:8554
# emulator-5554
adb devices

# adb start-server && emulator -avd emulator_for_e2e_testing -no-audio -no-window -no-boot-anim
```

### from your host
```sh
# sudo apt install scrcpy
# sudo snap install scrcpy
scrcpy -m 1024
```

### possible issue with start on Debian
```
Caused by: java.lang.IllegalArgumentException: displayToken must not be null
> just upgrade to scrcpy >= 1.18 
```

## android with VNC
```sh
sudo apt install cpu-checker
kvm-ok
# INFO: /dev/kvm exists
# KVM acceleration can be used
```

```sh
# https://github.com/budtmo/docker-android#list-of-devices
DEVICE_NAME="Samsung Galaxy S6"
# https://github.com/budtmo/docker-android#list-of-docker-images
IMAGE_NAME=budtmo/docker-android-x86-8.1

docker run --privileged -d -p 6080:6080 -p 5554:5554 -p 5555:5555 -e DEVICE="Samsung Galaxy S6" --name android-container budtmo/docker-android-x86-8.1

x-www-browser http://localhost:6080
# for ReadOnly only
x-www-browser http://localhost:6080?view_only=true 
```