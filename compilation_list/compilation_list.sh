#!/usr/bin/env bash

setup_date=$(date +"%Y%m%d")

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "                                                  "
echo "           SCRIPT UPDATED - JUN 22 2024           "
echo "                                                  "
echo "##################################################"

cd

mkdir ~/tools
cd ~/tools
touch "$setup_date"_setup.log

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

sudo ldconfig

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bedtools2###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/arq5x/bedtools2
cd bedtools2
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp bin/* ~/.local/bin
cd ~/tools

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
lftp -c get ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz
gunzip Pfam-A.hmm.gz
hmmpress Pfam-A.hmm 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up seqtk###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/seqtk
cd seqtk
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv seqtk ~/.local/bin
cd ~/tools
rm -rf seqtk

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up filtlong###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/rrwick/Filtlong.git
cd Filtlong
#echo "possible gcc13 build failure - add -#include <cstdint>- to kmer.h"
#https://github.com/rrwick/Filtlong/pull/39
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv bin/filtlong ~/.local/bin
cd ~/tools
rm -rf Filtlong

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up minimap###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/minimap2
cd minimap2
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv minimap2 ~/.local/bin
cd ~/tools
rm -rf minimap2

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up miniprot###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/miniprot
cd miniprot
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv miniprot ~/.local/bin
cd ~/tools
rm -rf miniprot

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bwa###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/bwa
cd bwa
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv bwa ~/.local/bin
cd ~/tools
rm -rf bwa

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up lastalign###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://gitlab.com/mcfrith/last
cd last
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp bin/* ~/.local/bin
cd ~/tools
rm -rf last

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bioawk###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/bioawk
cd bioawk
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp bioawk ~/.local/bin
cd ~/tools
rm -rf bioawk

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up trimal###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/inab/trimal
cd trimal/source
make -j 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv trimal ~/.local/bin
mv statal ~/.local/bin
mv readal ~/.local/bin
cd ~/tools
rm -rf trimal

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up iqtree2###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/iqtree/iqtree2
cd iqtree2/
#iqtree2/1 git repo seems to require manual submodule init and update - otherwise compilation will fail due to missing lsd2
#'git checkout latest' might be needed here too (Sep 19 2022)
git submodule init
git submodule update
mkdir build
cd build
cmake ..
make -j 1 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv iqtree2 ~/.local/bin
cd ~/tools
rm -rf iqtree2

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up muscle5###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/rcedgar/muscle
cd muscle/src
make -j 1 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp Linux/muscle ~/.local/bin
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
cp fastANI ~/.local/bin
cd ~/tools
rm -rf FastANI

wget http://www.microbesonline.org/fasttree/FastTreeMP
chmod +x FastTreeMP
mv FastTreeMP ~/.local/bin

wget http://opengene.org/fastp/fastp
chmod +x fastp
mv fastp ~/.local/bin

wget https://github.com/shenwei356/taxonkit/releases/download/v0.16.0/taxonkit_linux_amd64.tar.gz
tar zxvf taxonkit_linux_amd64.tar.gz
rm taxonkit_linux_amd64.tar.gz
mv taxonkit ~/.local/bin

lftp -c get ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz
tar zxvf taxdump.tar.gz
mkdir -p $HOME/.taxonkit
mv names.dmp nodes.dmp delnodes.dmp merged.dmp $HOME/.taxonkit
rm citations.dmp division.dmp gc.prt gencode.dmp images.dmp readme.txt taxdump.tar.gz

wget https://github.com/shenwei356/seqkit/releases/download/v2.8.2/seqkit_linux_amd64.tar.gz
tar zxvf seqkit_linux_amd64.tar.gz
rm seqkit_linux_amd64.tar.gz
mv seqkit ~/.local/bin

wget https://mmseqs.com/latest/mmseqs-linux-sse41.tar.gz
tar zxvf mmseqs-linux-sse41.tar.gz
ln -s ~/tools/mmseqs/bin/mmseqs ~/.local/bin/mmseqs
rm mmseqs-linux-sse41.tar.gz

git clone https://github.com/mpdunne/alan
mv alan/alan ~/.local/bin
rm -rf alan

wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.16.0+-x64-linux.tar.gz
tar zxvf ncbi-blast-2.16.0+-x64-linux.tar.gz
cp ncbi-blast-2.16.0+/bin/* ~/.local/bin
rm -rf ncbi-blast-2.16.0+-x64-linux.tar.gz ncbi-blast-2.16.0+

#entrez is being phased out - this portion will be removed soon
#wget through ftp does not seem to work anymore on fedora 40 onward
#sh -c "$(wget -q ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh -O -)"
lftp -c get ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh
chmod +x install-edirect.sh
./install-edirect.sh
rm install-edirect.sh

#datasets from NCBI as entrez replacement
lftp -c get https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/datasets
chmod +x datasets
mv datasets ~/.local/bin

wget https://github.com/makew0rld/amfora/releases/download/v1.10.0/amfora_1.10.0_linux_64-bit
mv amfora_1.10.0_linux_64-bit amfora
chmod +x amfora
mv amfora ~/.local/bin

git clone https://github.com/muennich/sxiv
cd sxiv
make -j
mv sxiv ~/.local/bin
cd ~/tools
rm -rf sxiv

git clone --recursive --branch release https://git.skyjake.fi/gemini/lagrange
mkdir lagrange_browser
cd lagrange_browser
cmake ~/tools/lagrange -DCMAKE_BUILD_TYPE=Release
cmake --build .
ln -s ~/tools/lagrange_browser/lagrange ~/.local/bin/lagrange
cd ~/tools
rm -rf lagrange

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
source ~/.bashrc

git clone https://github.com/atanunq/viu
cd viu
cargo install --path .
cp target/release/viu ~/.local/bin
cd ~/tools
rm -rf viu

git clone https://github.com/mbhall88/rasusa.git
cd rasusa
cargo build --release
cargo test --all
cp target/release/rasusa ~/.local/bin/
cd ~/tools
rm -rf rasusa

git clone https://github.com/fulcrumgenomics/fqgrep
cd fqgrep
cargo build --release
mv target/release/fqgrep ~/.local/bin
cd ~/tools
rm -rf fqgrep

pipx install pyfaidx
#ncbi-genome-download deprecated for https://github.com/AstrobioMike/bit
pipx install bpytop
pipx install html2text
pipx install termvisage

#alternate shell choices - wezterm vs kitty
#curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
#ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty

git clone https://github.com/hackerb9/lsix
mv lsix/lsix ~/.local/bin
rm -rf lsix

git clone https://github.com/hackerb9/vv
cp vv/vv ~/.local/bin
rm -rf vv

curl -fsSL https://install.julialang.org | sh

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "## You might want to add below paths to .bashrc ##"
echo "                                                  "
echo 'export PATH=${PATH}:$HOME/tools/scripts/sung-tools'
echo "                                                  "
echo "###### Also consider installing pandoc via  ######"
echo "##### https://github.com/jgm/pandoc/releases #####"
echo "                                                  "
echo "######## And consider bioconda setup from ########"
echo "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
echo "or mamba alternateive!                            "
echo "###### conda config --add channels defaults ######"
echo "###### conda config --add channels bioconda ######"
echo "#### conda config --add channels conda-forge #####"
echo "##################################################"
echo "##################################################"

cat << EOF
#julia environment setup
#.julia/config/startup.jl
add OhMyREPL, Revise

atreplinit() do repl
try
	@eval using OhMyREPL
	catch e
	@warn "error while importing OhMyREPL" exception=(e, catch_backtrace())
end
end

atreplinit() do repl
try
	@eval using Revise
	catch e
	@warn "error while importing Revise" exception=(e, catch_backtrace())
end
end

EOF
