# Archi tool doesn't have ability to work in headless mode and export files from "archimate" to "SVG", 
# current workaround is working with docker container and blindless manipulation on virtual screen
# to open file and export View to SVG
---

## run container
```
docker run \
--env http_proxy=$http_proxy \
--env https_proxy=$https_proxy \
--env no_proxy=$no_proxy \
--volume /home/projects/temp/docker-folder:/external \
-it ubuntu:18.04 /bin/sh
```

## install software
```
apt update
apt install -y software-properties-common wget xvfb xdotool libgtk-3-0
```

## start virtual display
```
export DISPLAY=:20
echo $DISPLAY
Xvfb $DISPLAY -screen 0 1366x768x16 &
```

## download Archi
```
wget https://www.archimatetool.com/downloads/4.4.0/Archi-Linux64-4.4.0.tgz
```

## unzip Archi
```
mkdir -p /Archi
tar -xvzf Archi-Linux64-4.4.0.tgz -C /
```

## script for exporting data
```bash
# apt-get install xdotool

# search window by name and activate it
xdotool search --name "Archi" | tail --line 1 | while read each_window
do
 # open file dialog
 # xdotool windowactivate $each_window 
 # activate Models
 xdotool mousemove --window $each_window 50 150 click 1; xdotool mousedown 1;xdotool mouseup 1
 # Views.last
 xdotool key --window $each_window Right End Right End Return
 # Export the View as an Image
 xdotool key --window $each_window Return alt+f e Down Down Return
 # Format SVG
 # xdotool key --window $each_window Tab Tab Down Down Down Down Return
 xdotool key --window $each_window Return
 sleep 2
 # exit from app
 xdotool key --window $each_window alt+f x
done 
```

## start Archi
### create settings for archi 
```
archi_settings="/root/.archi4"
source_file="/external/dq.archimate"
destination_file="/external/dq-airflow.svg"

# re-create settings 
rm -rf $archi_settings
mkdir -p $archi_settings/.metadata/.plugins/org.eclipse.core.runtime/.settings/
# skip intro page showing
printf "eclipse.preferences.version=1\nshowIntro=false" | tee $archi_settings/.metadata/.plugins/org.eclipse.core.runtime/.settings/org.eclipse.ui.prefs
# open source file as a default model
printf '<?xml version="1.0" encoding="UTF-8"?><models><model file="'$source_file'" /></models>' | tee $archi_settings/models.xml
# default export - SVG
printf "ExportImageLastFile=$destination_file\nExportImageLastProvider=com.archimatetool.export.svg.imageExporter\neclipse.preferences.version=1" | tee $archi_settings/.metadata/.plugins/org.eclipse.core.runtime/.settings/com.archimatetool.editor.prefs
/Archi/Archi &

# clean up destination file
rm $destination_file

# execute script that described above
/external/activate-window.sh
```





