#!/usr/bin/env bash

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
echo "           SCRIPT UPDATED - DEC 14 2022           "
echo "                                                  "
echo "##################################################"

cd
sudo apt update
sudo apt upgrade
sudo apt install imagemagick curl enscript ffmpeg gnuplot grads graphviz groff build-essential git bison zathura zathura-ps zathura-djvu python3-pip m4 m4-doc dictd dict-gcide dict-freedict-fra-eng openssh-client openssh-server gdb parallel lynx autoconf autoconf-doc automake libtool zlib1g p7zip-full p7zip-rar unrar unzip make gcc perl zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev libncurses5-dev libgmp-dev libunistring-dev libffi-dev libgc-dev vlc libglib2.0-dev libmagickwand-dev gtk-doc-tools pv cmake libmpfr-dev libmpc-dev ninja-build sox lame flac mencoder ecasound vorbis-tools colordiff xclip libreadline-dev neofetch lm-sensors libgtk-3-dev libgdk-pixbuf2.0-dev libssl-dev libimlib2-dev libgif-dev libexif-dev libxft-dev fontconfig jq mpv lftp htop gfortran liblapack-dev libopenblas-dev python-is-python3 libimage-exiftool-perl libeigen3-dev libboost-all-dev libvirt-daemon qemu-kvm virt-manager texlive-xetex texlive-fonts-recommended texlive-plain-generic libfuse2 rlwrap

mkdir ~/tools
cd ~/tools
mkdir bin

git clone https://github.com/arq5x/bedtools2
cd bedtools2
make -j
cp bin/* ~/tools/bin
cd ~/tools

git clone https://github.com/samtools/htslib
cd htslib
git submodule update --init --recursive
autoreconf -i
./configure
make -j
sudo make install
cd ~/tools
rm -rf htslib

git clone https://github.com/samtools/samtools
cd samtools
autoheader
autoconf -Wno-syntax
./configure
make -j
cp samtools ~/tools/bin
cd ~/tools
rm -rf samtools

wget http://eddylab.org/software/hmmer/hmmer.tar.gz
tar zxvf hmmer.tar.gz
rm hmmer.tar.gz
cd hmmer-3.3.2
./configure
make -j
sudo make install
cd easel
sudo make install
cd ~/tools
rm -rf hmmer-3.3.2

mkdir pfam
cd pfam
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz
gunzip Pfam-A.hmm.gz
hmmpress Pfam-A.hmm
cd ~/tools

git clone https://github.com/lh3/seqtk
cd seqtk
make -j
mv seqtk ~/tools/bin
cd ~/tools
rm -rf seqtk

git clone https://github.com/rrwick/Filtlong.git
cd Filtlong
make -j
mv bin/filtlong ~/tools/bin
cd ~/tools
rm -rf Filtlong

git clone https://github.com/lh3/minimap2
cd minimap2
make -j
mv minimap2 ~/tools/bin
cd ~/tools
rm -rf minimap2

git clone https://github.com/lh3/miniprot
cd miniprot
make -j
mv miniprot ~/tools/bin
cd ~/tools
rm -rf miniprot

git clone https://github.com/lh3/bwa
cd bwa
make -j
mv bwa ~/tools/bin
cd ~/tools
rm -rf bwa

git clone https://gitlab.com/mcfrith/last
cd last
make -j
cp bin/* ~/tools/bin
cd ~/tools
rm -rf last

git clone https://github.com/lh3/bioawk
cd bioawk
make
cp bioawk ~/tools/bin
cd ~/tools
rm -rf bioawk

git clone https://github.com/inab/trimal
cd trimal/source
make -j
mv trimal ~/tools/bin
mv statal ~/tools/bin
mv readal ~/tools/bin
cd ~/tools
rm -rf trimal

git clone https://github.com/iqtree/iqtree2
mkdir iqtree2/build
cd iqtree2/
#iqtree2/1 git repo seems to require manual submodule init and update - otherwise compilation will fail due to missing lsd2
#'git checkout latest' might be needed here too (Sep 19 2022)
git submodule init
git submodule update
cd build
cmake ..
make -j
mv iqtree2 ~/tools/bin
cd ~/tools
rm -rf iqtree2

git clone https://github.com/rcedgar/muscle
cd muscle/src
make -j
cp Linux/muscle ~/tools/bin
cd ~/tools
rm -rf muscle

wget http://www.microbesonline.org/fasttree/FastTreeDbl
chmod +x FastTreeDbl
mv FastTreeDbl ~/tools/bin

wget http://opengene.org/fastp/fastp
chmod +x fastp 
mv fastp ~/tools/bin

wget https://github.com/shenwei356/taxonkit/releases/download/v0.14.0/taxonkit_linux_amd64.tar.gz
tar zxvf taxonkit_linux_amd64.tar.gz
rm taxonkit_linux_amd64.tar.gz
mv taxonkit ~/tools/bin

wget -c ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz
tar zxvf taxdump.tar.gz
mkdir -p $HOME/.taxonkit
mv names.dmp nodes.dmp delnodes.dmp merged.dmp $HOME/.taxonkit
rm citations.dmp division.dmp gc.prt gencode.dmp readme.txt taxdump.tar.gz

wget https://github.com/shenwei356/seqkit/releases/download/v2.3.1/seqkit_linux_amd64.tar.gz
tar zxvf seqkit_linux_amd64.tar.gz
rm seqkit_linux_amd64.tar.gz
mv seqkit ~/tools/bin

wget https://github.com/makeworld-the-better-one/amfora/releases/download/v1.9.2/amfora_1.9.2_linux_64-bit
mv amfora_1.9.2_linux_64-bit amfora
chmod +x amfora
mv amfora ~/tools/bin

git clone https://github.com/muennich/sxiv
cd sxiv
make -j
mv sxiv ~/tools/bin
cd ~/tools
rm -rf sxiv

wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.13.0+-x64-linux.tar.gz
tar zxvf ncbi-blast-2.13.0+-x64-linux.tar.gz
cp ncbi-blast-2.13.0+/bin/* ~/tools/bin
rm -rf ncbi-blast-2.13.0+-x64-linux.tar.gz ncbi-blast-2.13.0+

sh -c "$(wget -q ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh -O -)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
source ~/.bashrc

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

git clone https://github.com/rrwick/Polypolish.git
cd Polypolish
cargo build --release
mv target/release/polypolish ~/tools/bin
cd ~/tools
rm -rf Polypolish

git clone https://github.com/fulcrumgenomics/fqgrep
cd fqgrep
cargo build --release
mv target/release/fqgrep ~/tools/bin
cd ~/tools
rm -rf fqgrep

pip3 install pyfaidx
pip3 install biopython
pip3 install ncbi-genome-download
pip3 install bpytop
pip3 install pipenv
pip3 install html2text

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "## You might want to add below paths to .bashrc ##"
echo "                                                  "
echo 'export PATH=${PATH}:$HOME/tools/bin               '
echo 'export PATH=${PATH}:$HOME/.local/bin              '
echo 'export PATH=${PATH}:$HOME/tools/scripts/sung-tools'
echo "                                                  "
echo "###### Also consider installing pandoc via  ######"
echo "##### https://github.com/jgm/pandoc/releases #####"
