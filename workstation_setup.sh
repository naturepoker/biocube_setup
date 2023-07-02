#!/usr/bin/env bash

setup_date=$(date +"%Y%m%d")

if [[ $(uname -p) == x86_64 ]]; then
	printf "\n Compatible CPU architecture found \n"
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
echo "           SCRIPT UPDATED - MAY 22 2023           "
echo "                   Sung won Lim                   "
echo "##################################################"

cd
sudo apt update
sudo apt upgrade
sudo apt install imagemagick curl enscript ffmpeg gnuplot grads graphviz groff build-essential git bison python3-pip m4 m4-doc dictd dict-gcide dict-freedict-fra-eng openssh-client openssh-server gdb parallel lynx autoconf autoconf-doc automake libtool zlib1g p7zip-full p7zip-rar unrar unzip make gcc perl zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev libncurses5-dev libgmp-dev libunistring-dev libffi-dev libgc-dev vlc libglib2.0-dev libmagickwand-dev gtk-doc-tools pv cmake libmpfr-dev libmpc-dev ninja-build colordiff xclip libreadline-dev neofetch lm-sensors libgtk-3-dev libgdk-pixbuf2.0-dev libssl-dev libimlib2-dev libgif-dev libexif-dev libxft-dev fontconfig jq lftp htop gfortran liblapack-dev libopenblas-dev python-is-python3 libimage-exiftool-perl libeigen3-dev libboost-all-dev libvirt-daemon qemu-kvm virt-manager texlive-xetex texlive-fonts-recommended texlive-plain-generic libfuse2 rlwrap python3-testresources libgsl-dev

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
cd hmmer-3.3.2
./configure 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make check 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
sudo make install
cd easel
sudo make install
cd ~/tools
rm -rf hmmer-3.3.2

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

wget https://mmseqs.com/latest/mmseqs-linux-avx2.tar.gz
tar zxvf mmseqs-linux-avx2.tar.gz
ln -s ~/tools/mmseqs/bin/mmseqs ~/tools/bin/mmseqs
rm mmseqs-linux-sse41.tar.gz

git clone https://github.com/mpdunne/alan
mv alan/alan ~/tools/bin
rm -rf alan

wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.14.0+-x64-linux.tar.gz
tar zxvf ncbi-blast-2.14.0+-x64-linux.tar.gz
cp ncbi-blast-2.14.0+/bin/* ~/tools/bin
rm -rf ncbi-blast-2.14.0+-x64-linux.tar.gz ncbi-blast-2.14.0+

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

echo "##################################################" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "##################################################" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "##################################################" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "## You might want to add below paths to .bashrc ##" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "                                                  " 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo 'export PATH=${PATH}:$HOME/tools/bin               ' 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo 'export PATH=${PATH}:$HOME/.local/bin              ' 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "                                                  " 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###### Also consider installing pandoc via  ######" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "##### https://github.com/jgm/pandoc/releases #####" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "                                                  " 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "######## And consider bioconda setup from ########" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###### conda config --add channels defaults ######" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###### conda config --add channels bioconda ######" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "#### conda config --add channels conda-forge #####" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
