install inside docker container
```sh
docker run -it ubuntu:18.04 /bin/sh

### installation
apt update
apt install -y software-properties-common wget xvfb xdotool libgtk-3-0
# apt -y install tightvncserver
apt install -y x11vnc
apt install xfce4
```
commit docker container
```sh
docker commit a4ae8ec ubuntu-xfce4-vnc
```

start created docker container with exposing some ports
```sh
docker run -it -p 5900:5900 -p 5901:5901 ubuntu-xfce4-vnc /bin/sh
```

start applications inside
```sh
### virtual display
export DISPLAY=:0
Xvfb $DISPLAY -screen 0 1920x1080x16 &

### ui, start desktop

export XKL_XMODMAP_DISABLE=1
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
xsetroot -solid grey
xfce4-session &
# /usr/bin/startxfce4 --replace &




### vnc
## generate password
x11vnc -storepasswd "vnc-docker" /etc/x11vnc.pass
## start server
# x11vnc -display $DISPLAY -rfbauth /etc/x11vnc.pass
# x11vnc -quiet -localhost -viewonly -nopw -bg -noxdamage -display $DISPLAY &
x11vnc -display $DISPLAY &

# vncserver -geometry 1920x1080
```