#!/usr/bin/env bash

setup_date=$(date +"%Y%m%d")

if ! command -v zypper > /dev/null; then
	printf "\n This script is meant for a distro with zypper command. Exiting"
	exit
fi


echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "                                                  "
echo "           SCRIPT UPDATED - JUN 30 2024           "
echo "                                                  "
echo "##################################################"

cd

#adapting from below guides - in order
#https://en.opensuse.org/SDB:NVIDIA_drivers
#https://en.opensuse.org/Additional_package_repositories
#https://en.opensuse.org/SDB:Installing_codecs_from_Packman_repositories
#base test hardware is W530 with Quadro K1000M - don't forget to take Nvidia driver requirement into account on a new machine!

#checking for multiversion kernel
sudo grep 'multiversion' /etc/zypp/zypp.conf

#installing NVIDIA repo for leap
sudo zypper install openSUSE-repos-Leap-NVIDIA

#checking for available driver versions
sudo zypper se -s x11-video-nvidiaG0* nvidia-video-G06* nvidia-gl*G0*

#installing nvidia 470 type driver - supposedly suitable for K1000M
sudo zypper in x11-video-nvidiaG05
sudo zypper in nvidia-glG05

#installing community repo opi interface
sudo zypper install opi

#adding packman-essentials repo - anything further would defeat the purpose of running a leap version
sudo zypper ar -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_$releasever/Essentials' packman-essentials

#registering vendor change
sudo zypper dup --from packman-essentials --allow-vendor-change
sudo zypper ref

#installing new codecs
sudo zypper install --allow-vendor-change --from packman-essentials ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec vlc-codecs
sudo zypper ref
sudo zypper dup
#standard refresh-update cycle on openSUSE seems to simply follow zypper ref-dup
#development suite installation might require below command:
#zypper install -t pattern devel_basis
#however, openSUSE takes care of much of development suites during initial installation with yast

#installing other base packages
sudo zypper install \
boost-devel cmake colordiff dictd datamash eigen3-devel fetchmsttfonts flac flatpak gdk-pixbuf-devel \
giflib-devel gnu_parallel gnuplot graphviz gsl-devel htop ImageMagick \
imlib2-devel java-21-openjdk-devel lame lapack-devel lftp libcurl-devel \
libexif-devel libSDL2_gfx-devel libopenssl-3-devel libsixel-devel libunistring-devel \
libvirt-daemon lynx lzma-sdk-devel meson mpc-devel mpfr-devel mpv \
neofetch ninja openblas-common-devel podman pv python311-pipx qemu rlwrap sox \
texlive-plain texlive-unfonts-core-fonts texlive-xetex unrar unzip virt-manager virt-manager-common \
vorbis-tools vte-devel zathura zathura-plugin-pdf-mupdf zathura-plugin-ps zip vlc libjack0

#setting up flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#distrobox setup
wget -qO- https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
#for uninstall run:
#curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/uninstall | sh -s -- --prefix ~/.local

mkdir ~/.local/bin

chmod +x ../compilation_list/compilation_list.sh
./../compilation_list/compilation_list.sh
