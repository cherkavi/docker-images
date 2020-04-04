Xvfb $DISPLAY -screen 0 1920x1080x16 &
startxfce4 &
x11vnc -rfbport 5900 -repeat -display $DISPLAY &
