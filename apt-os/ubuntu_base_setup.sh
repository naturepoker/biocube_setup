#!/usr/bin/env bash

setup_date=$(date +"%Y%m%d")


if [[ $(uname -p) == x86_64 ]]; then
	printf "\n Compatible CPU architecture found"
else
	printf "\n Incompatible architecture found. This setup script is meant for x86_64 machines"
	exit
fi

if ! command -v apt > /dev/null; then
	printf "\n This script is meant for Debian/Ubuntu systems with apt command. Exiting"
	exit
fi


echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "                                                  "
echo "           SCRIPT UPDATED - JUL 02 2023           "
echo "                                                  "
echo "##################################################"

cd
sudo apt update
sudo apt upgrade
sudo apt install autoconf autoconf-doc automake bison build-essential cmake colordiff curl default-jdk dictd dict-freedict-fra-eng dict-gcide ecasound enscript ffmpeg flac fontconfig gcc gdb gfortran git gnuplot grads graphviz groff gtk-doc-tools htop imagemagick jq lame lftp libboost-all-dev libbz2-dev libcurl4-gnutls-dev libeigen3-dev libexif-dev libffi-dev libfribidi-dev libfuse2 libgc-dev libgdk-pixbuf2.0-dev libgif-dev libglib2.0-dev libgmp-dev libgsl-dev libgtk-3-dev libimage-exiftool-perl libimlib2-dev liblapack-dev liblzma-dev libmagickwand-dev libmpc-dev libmpfr-dev libmpg123-dev libncurses5-dev libopenblas-dev libpcre3-dev libreadline-dev libsdl2-dev libssl-dev libtool libunistring-dev libvirt-daemon libxft-dev lm-sensors lynx m4 m4-doc make mencoder mpv neofetch ninja-build openssh-client openssh-server p7zip-full p7zip-rar parallel perl pv python3-pip python3-testresources python-is-python3 qemu-kvm rlwrap sox sudo texlive-fonts-recommended texlive-plain-generic texlive-xetex unrar unzip virt-manager vlc vorbis-tools xclip zathura zathura-djvu zathura-ps zlib1g zlib1g-dev

mkdir ~/.local/bin

chmod +x ../compilation_list/compilation_list.sh
./../compilation_list/compilation_list.sh


