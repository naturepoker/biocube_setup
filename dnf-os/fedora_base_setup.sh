#!/usr/bin/env bash

setup_date=$(date +"%Y%m%d")

if ! command -v dnf > /dev/null; then
	printf "\n This script is meant for a distro with DNF command. Exiting"
	exit
fi


echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "                                                  "
echo "           SCRIPT UPDATED - Jan 29 2026           "
echo "                                                  "
echo "##################################################"

#assumes manual dnf update and initial upgrade & refresh
#echo "max_parallel_downloads=20" >>  /etc/dnf/dnf.conf
#sudo dnf -y upgrade --refresh
#reboot

#adding free and nonfree fusion repos
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf makecache
sudo dnf upgrade --refresh
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf install -y dnf-plugins-core
sudo dnf -y group upgrade core
#sudo dnf config-manager setopt fedora-cisco-openh264=1
sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264
sudo dnf install lame\* --exclude=lame-devel
#if using nvidia drivers:
#sudo dnf install akmod-nvidia
#sudo dnf install xorg-x11-drv-nvidia-cuda

sudo dnf group install development-tools
sudo dnf group install c-development
sudo dnf install @multimedia

sudo dnf install -y --skip-unavailable tmux wl-clipboard bat imlib2-devel p7zip p7zip-plugins cmake colordiff datamash eigen3-devel fira-code-fonts flac flatpak gdk-pixbuf2-devel giflib-devel parallel gnuplot gsl-devel pipx htop ImageMagick zip imlib2 java-21-openjdk-devel lapack-devel lftp libexif-devel SDL2_gfx-devel meson gd-devel libunistring-devel lzma-sdk-devel libmpc-devel mpfr-devel mpv openblas-devel pv qemu rlwrap sox virt-manager unrar vte-devel zathura zathura-djvu zathura-pdf-mupdf w3m podman lm_sensors kernel-devel kernel-headers dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig distrobox libcurl-devel boost-devel

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf copr enable wezfurlong/wezterm-nightly
sudo dnf -y install wezterm

cat << 'EOF' > ~/.wezterm.lua
--wezterm api
local wezterm = require("wezterm")

--config hold
local config = wezterm.config_builder()

--config choices
config.color_scheme = "Aurora"

config.font = wezterm.font("JetBrains Mono")
config.font_size=19

config.window_background_opacity = 0.9

--return config to wezterm
return config
EOF

cat << 'EOF'
machine hostname setup
sudo hostnamectl set-hostname --static name

check installed fonts with fc-list

mod foot terminal via .config/foot/foot.ini
[main]
font=Fira Code:size=20:fontfeatures=ss01
EOF

chmod +x ../compilation_list/personal_env_compilation_list.sh
./../compilation_list/personal_env_compilation_list.sh
