FROM ubuntu:18.04

RUN apt update
RUN apt install -y xfce4
RUN apt install -y software-properties-common wget xvfb xdotool libgtk-3-0
RUN apt install -y x11vnc

ENV DISPLAY :0.0
ENV DEBIAN_FRONTEND noninteractive
ADD "./entrypoint.sh" "/entrypoint.sh"
# ENTRYPOINT ["/entrypoint.sh"]