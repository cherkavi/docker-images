---
# create container 

install inside docker container
```sh
docker run -it ubuntu:18.04 /bin/sh

### installation
apt update
apt install -y software-properties-common wget xvfb xdotool libgtk-3-0
# apt -y install tightvncserver
apt install -y x11vnc
apt install -y xfce4
```

commit docker container
```sh
docker commit a4ae8ec ubuntu-xfce4-vnc
```

start created docker container with exposing some ports
```sh
docker run -it -p 5900:5900 -p 5901:5901 ubuntu-xfce4-vnc /bin/sh
```

---
# start UI session, start vnc
* x11
```sh
export DISPLAY=:0
Xvfb $DISPLAY -screen 0 1920x1080x16 &
sleep 1
x11vnc -quiet -localhost -viewonly -nopw -bg -noxdamage -display $DISPLAY &
sleep 1
```
* xfce4
```sh
### start virtual display
export DISPLAY=:0.0
Xvfb $DISPLAY -screen 0 1920x1080x16 &

### start ui, start desktop
startxfce4 &


### vnc
## generate password
x11vnc -storepasswd "vnc-docker" /etc/x11vnc.pass

## start vnc server
x11vnc -display $DISPLAY &
# x11vnc -display $DISPLAY -rfbauth /etc/x11vnc.pass
# x11vnc -quiet -localhost -viewonly -nopw -bg -noxdamage -rfbauth /etc/x11vnc.pass -display $DISPLAY &
# x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /etc/x11vnc.pass -rfbport 5900 -shared -display $DISPLAY &
```

[vnc for linux](https://www.realvnc.com/en/connect/download/viewer/linux/)
```sh
sudo apt install xvnc4viewer
```
!!! don't use Remmina !!!
