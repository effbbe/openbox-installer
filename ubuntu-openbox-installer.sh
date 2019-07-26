#!/bin/bash
if [ -z "$SUDO_USER" ]
  then 
  echo "\$SUDO_USER is empty. Using $(ls /home)"
  SUDO_USER=(ls /home)
 fi

#Turn those space separated list into bash arrays
SUDO_USER=($SUDO_USER)

DEBIAN_FRONTEND=noninteractive apt -y sudo
for user in  $SUDO_USER
do
  adduser $user sudo
done

## Installing openbox and supporting applications
echo "Installing openbox and supporting applications"
sudo apt-get install -y openbox obsession obconf menu obmenu xorg xserver-xorg lightdm \
lightdm-gtk-greeter lightdm-gtk-greeter-settings gnome-terminal lxappearance tint2 \
gmrun cifs-utils gvfs-backends policykit-1-gnome gnome-icon-theme-full volumeicon-alsa xscreensaver \
xscreensaver-gl xfce4-power-manager pulseaudio network-manager pavucontrol nitrogen \
network-manager-gnome
echo "Install success with no errors =)"

#Configuring openbox, autostart & menu 
echo "Create Openbox Directory"
mkdir -p ~/.config/openbox && cd ~/.config/openbox
echo "Copying autostart file"
wget https://raw.githubusercontent.com/randalltuxarc/openbox-installer-kali-linux/master/misc/autostart
echo "Copying rc.xml"
wget https://raw.githubusercontent.com/randalltuxarc/openbox-installer-kali-linux/master/misc/rc.xml
echo "Copying menu.xml"
wget https://raw.githubusercontent.com/randalltuxarc/openbox-installer-kali-linux/master/misc/menu.xml
echo "Copying file success"
