# docker build --tag blackarch .
# docker run -it blackarch mdcrack -s "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" -S 4 -M MD5 {hash code} > out.txt

FROM archlinux/base

# https://blackarch.org/downloads.html#install-repo
RUN curl -O https://blackarch.org/strap.sh && chmod +x strap.sh
RUN /bin/sh strap.sh

RUN pacman --noconfirm -S grep ranger

# tools.installation.all
# RUN pacman --noconfirm -S blackarch

# tools.list.all
# pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u

# tools.install.mdcrack
RUN pacman --noconfirm -S  mdcrack

# tools.list.categories    see categories
# RUN pacman -Sg | grep blackarch

# install a category of tools
# RUN pacman -S blackarch-<category>
