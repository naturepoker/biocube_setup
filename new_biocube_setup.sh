#!/usr/bin/env bash

if ! command -v apt > /dev/null; then
	printf "\n This script is meant for Debian/Ubuntu systems with apt command. Exiting"
	exit
fi


echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "                                                  "
echo "           SCRIPT UPDATED - SEP 03 2022           "
echo "                                                  "
echo "##################################################"

cd
apt update
apt upgrade
apt install imagemagick curl enscript ffmpeg gnuplot grads graphviz groff build-essential git bison zathura zathura-ps zathura-djvu python3-pip m4 m4-doc dictd dict-gcide dict-freedict-fra-eng openssh-client openssh-server gdb parallel lynx autoconf autoconf-doc automake libtool zlib1g p7zip-full p7zip-rar unrar unzip make gcc perl zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev libncurses5-dev libgmp-dev libunistring-dev libffi-dev libgc-dev vlc libglib2.0-dev libmagickwand-dev gtk-doc-tools pv cmake libmpfr-dev libmpc-dev ninja-build sox lame flac mencoder ecasound vorbis-tools colordiff xclip libreadline-dev neofetch lm-sensors libgtk-3-dev libgdk-pixbuf2.0-dev libssl-dev libimlib2-dev libgif-dev libexif-dev libxft-dev fontconfig jq mpv lftp htop gfortran liblapack-dev libopenblas-dev python-is-python3

mkdir ~/tools
cd ~/tools
mkdir bin

git clone https://github.com/arq5x/bedtools2
cd bedtools2
make
cp bin/* ~/tools/bin
cd ~/tools

git clone https://github.com/samtools/samtools
cd samtools
autoheader
autoconf -Wno-syntax
./configure
make
cp samtools ~/tools/bin
cd ~/tools
rm -rf samtools

wget http://eddylab.org/software/hmmer/hmmer.tar.gz
tar zxvf hmmer.tar.gz
cd hmmer-3.3.2
./configure
make
make install
cd easel
make install
cd ~/tools
rm -rf hmmer-3.3.2

git clone https://github.com/lh3/seqtk
cd seqtk
make
mv seqtk ~/tools/bin
cd ~/tools
rm -rf seqtk

git clone https://github.com/lh3/minimap2
cd minimap2
make
mv minimap2 ~/tools/bin
cd ~/tools
rm -rf minimap2

git clone https://github.com/lh3/bwa
cd bwa
make
mv bwa ~/tools/bin
cd ~/tools
rm -rf bwa

git clone https://gitlab.com/mcfrith/last
cd last
make
cp bin/* ~/tools/bin
cd ~/tools
rm -rf last

git clone https://github.com/lh3/bioawk
cd bioawk
make
cp bioawk ~/tools/bin
cd ~/tools
rm -rf bioawk

wget https://github.com/makeworld-the-better-one/amfora/releases/download/v1.9.2/amfora_1.9.2_linux_64-bit
mv amfora_1.9.2_linux_64-bit amfora
chmod +x amfora
mv amfora ~/tools/bin

git clone https://github.com/muennich/sxiv
cd sxiv
make
mv sxiv ~/tools/bin
cd ~/tools
rm -rf sxiv

wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.13.0+-x64-linux.tar.gz
tar zxvf ncbi-blast-2.13.0+-x64-linux.tar.gz
cp ncbi-blast-2.13.0+/bin/* ~/tools/bin
rm -rf ncbi-blast-2.13.0+-x64-linux.tar.gz ncbi-blast-2.13.0+

sh -c "$(wget -q ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh -O -)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

git clone https://github.com/atanunq/viu
cd viu
cargo install --path .
cp target/release/viu ~/tools/bin
cd ~/tools
rm -rf viu

git clone https://git.sr.ht/~julienxx/castor
cd castor
make
cp target/release/castor ~/tools/bin
cd ~/tools
rm -rf castor

pip3 install pyfaidx
pip3 install biopython
pip3 install ncbi-genome-download
pip3 install bpytop

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "## You might want to add below paths to .bashrc ##"
echo "                                                  "
echo "export PATH=${PATH}:$HOME/tools/bin               "
echo "export PATH=${PATH}:$HOME/.local/bin              "
echo "export PATH=${PATH}:$HOME/tools/scripts/sung-tools"
echo "                                                  "
echo "                                                  "
