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
echo "           SCRIPT UPDATED - NOV 12 2023           "
echo "                                                  "
echo "##################################################"

cd
sudo apt update
sudo apt upgrade
sudo apt install autoconf autoconf-doc automake bison build-essential cmake colordiff curl dictd dict-freedict-fra-eng dict-gcide ecasound enscript ffmpeg flac fontconfig gcc gdb gfortran git gnuplot grads graphviz groff gtk-doc-tools htop imagemagick jq lame lftp libboost-all-dev libbz2-dev libcurl4-gnutls-dev libeigen3-dev libexif-dev libffi-dev libfribidi-dev libfuse2 libgc-dev libgdk-pixbuf2.0-dev libgif-dev libglib2.0-dev libgmp-dev libgsl-dev libgtk-3-dev libimage-exiftool-perl libimlib2-dev liblapack-dev liblzma-dev libmagickwand-dev libmpc-dev libmpfr-dev libmpg123-dev libncurses5-dev libopenblas-dev libpcre3-dev libreadline-dev libsdl2-dev libssl-dev libtool libunistring-dev libvirt-daemon libxft-dev lm-sensors lynx m4 m4-doc make mencoder mpv neofetch ninja-build openssh-client openssh-server p7zip-full p7zip-rar parallel perl pv python3-pip python3-testresources python-is-python3 qemu-kvm rlwrap sox sudo texlive-fonts-recommended texlive-plain-generic texlive-xetex unrar unzip virt-manager vlc vorbis-tools xclip zathura zathura-djvu zathura-ps zlib1g zlib1g-dev

mkdir ~/tools
cd ~/tools
mkdir bin
touch "$setup_date"_setup.log

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bedtools2###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/arq5x/bedtools2
cd bedtools2
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp bin/* ~/tools/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up htslib###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/samtools/htslib
cd htslib
git submodule update --init --recursive
autoreconf -i
./configure 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
sudo make install
cd ~/tools
rm -rf htslib

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up samtools###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/samtools/samtools
cd samtools
autoheader
autoconf -Wno-syntax
./configure 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
sudo make install
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up hmmer###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
wget http://eddylab.org/software/hmmer/hmmer.tar.gz
tar zxvf hmmer.tar.gz
rm hmmer.tar.gz
cd hmmer-*
./configure 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make check 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
sudo make install
cd easel
sudo make install
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up pfam-A###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mkdir pfam
cd pfam
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz
gunzip Pfam-A.hmm.gz
hmmpress Pfam-A.hmm 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up seqtk###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/seqtk
cd seqtk
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv seqtk ~/tools/bin
cd ~/tools
rm -rf seqtk

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up filtlong###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/rrwick/Filtlong.git
cd Filtlong
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv bin/filtlong ~/tools/bin
cd ~/tools
rm -rf Filtlong

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up minimap###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/minimap2
cd minimap2
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv minimap2 ~/tools/bin
cd ~/tools
rm -rf minimap2

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up miniprot###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/miniprot
cd miniprot
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv miniprot ~/tools/bin
cd ~/tools
rm -rf miniprot

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bwa###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/bwa
cd bwa
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv bwa ~/tools/bin
cd ~/tools
rm -rf bwa

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up lastalign###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://gitlab.com/mcfrith/last
cd last
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp bin/* ~/tools/bin
cd ~/tools
rm -rf last

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bioawk###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/bioawk
cd bioawk
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp bioawk ~/tools/bin
cd ~/tools
rm -rf bioawk

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up trimal###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/inab/trimal
cd trimal/source
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv trimal ~/tools/bin
mv statal ~/tools/bin
mv readal ~/tools/bin
cd ~/tools
rm -rf trimal

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up iqtree2###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/iqtree/iqtree2
mkdir iqtree2/build
cd iqtree2/
#iqtree2/1 git repo seems to require manual submodule init and update - otherwise compilation will fail due to missing lsd2
#'git checkout latest' might be needed here too (Sep 19 2022)
git submodule init
git submodule update
mkdir build
cd build
cmake ..
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv iqtree2 ~/tools/bin
cd ~/tools
rm -rf iqtree2

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up muscle5###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/rcedgar/muscle
cd muscle/src
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp Linux/muscle ~/tools/bin
cd ~/tools
rm -rf muscle

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up FastANI###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/ParBLiSS/FastANI
cd FastANI
./bootstrap.sh 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
./configure 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp fastANI ~/tools/bin
cd ~/tools
rm -rf FastANI

wget http://www.microbesonline.org/fasttree/FastTreeMP
chmod +x FastTreeMP
mv FastTreeMP ~/tools/bin

wget http://opengene.org/fastp/fastp
chmod +x fastp
mv fastp ~/tools/bin

wget https://github.com/shenwei356/taxonkit/releases/download/v0.14.1/taxonkit_linux_amd64.tar.gz
tar zxvf taxonkit_linux_amd64.tar.gz
rm taxonkit_linux_amd64.tar.gz
mv taxonkit ~/tools/bin

wget -c ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz
tar zxvf taxdump.tar.gz
mkdir -p $HOME/.taxonkit
mv names.dmp nodes.dmp delnodes.dmp merged.dmp $HOME/.taxonkit
rm citations.dmp division.dmp gc.prt gencode.dmp images.dmp readme.txt taxdump.tar.gz

wget https://github.com/shenwei356/seqkit/releases/download/v2.4.0/seqkit_linux_amd64.tar.gz
tar zxvf seqkit_linux_amd64.tar.gz
rm seqkit_linux_amd64.tar.gz
mv seqkit ~/tools/bin

wget https://mmseqs.com/latest/mmseqs-linux-sse41.tar.gz
tar zxvf mmseqs-linux-sse41.tar.gz
ln -s ~/tools/mmseqs/bin/mmseqs ~/tools/bin/mmseqs
rm mmseqs-linux-sse41.tar.gz

git clone https://github.com/mpdunne/alan
mv alan/alan ~/tools/bin
rm -rf alan

wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.15.0+-x64-linux.tar.gz
tar zxvf ncbi-blast-2.15.0+-x64-linux.tar.gz
cp ncbi-blast-2.15.0+/bin/* ~/tools/bin
rm -rf ncbi-blast-2.15.0+-x64-linux.tar.gz ncbi-blast-2.15.0+

sh -c "$(wget -q ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh -O -)"

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

wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
chmod +x yt-dlp
mv yt-dlp ~/tools/bin

git clone --recursive --branch release https://git.skyjake.fi/gemini/lagrange
mkdir lagrange_browser
cd lagrange_browser
cmake ~/tools/lagrange -DCMAKE_BUILD_TYPE=Release
cmake --build .
ln -s ~/tools/lagrange_browser/lagrange ~/tools/bin/lagrange
cd ~/tools
rm -rf lagrange

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
source ~/.bashrc

git clone https://github.com/atanunq/viu
cd viu
cargo install --path .
cp target/release/viu ~/tools/bin
cd ~/tools
rm -rf viu

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

curl -fsSL https://install.julialang.org | sh

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
echo "                                                  "
echo "######## And consider bioconda setup from ########"
echo "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
echo "###### conda config --add channels defaults ######"
echo "###### conda config --add channels bioconda ######"
echo "#### conda config --add channels conda-forge #####"
