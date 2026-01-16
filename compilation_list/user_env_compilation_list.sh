#!/usr/bin/env bash

setup_date=$(date +"%Y%m%d")

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "                                                  "
echo "           SCRIPT UPDATED - JAN 16 2026           "
echo "                                                  "
echo "##################################################"

cd

mkdir ~/tools
cd ~/tools
touch "$setup_date"_setup.log

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up htslib###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/samtools/htslib.git
cd htslib
git submodule update --init --recursive
autoreconf -i
./configure 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
sudo make install
cd ~/tools
rm -rf htslib

sudo ldconfig

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bedtools2###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/arq5x/bedtools2.git
cd bedtools2
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
ln -s $PWD/bin/* ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up samtools###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/samtools/samtools.git
cd samtools
autoheader
autoconf -Wno-syntax
./configure 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
ln -s $PWD/samtools ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bcftools###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/samtools/bcftools.git
cd bcftools
autoheader && autoconf && ./configure --enable-libgsl 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
ln -s $PWD/bcftools ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up hmmer###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
wget http://eddylab.org/software/hmmer/hmmer.tar.gz
tar zxvf hmmer.tar.gz
rm hmmer.tar.gz
cd hmmer-*
./configure 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
make check 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
sudo make
ln -s $PWD/src/alimask ~/.local/bin
ln -s $PWD/src/hmmalign ~/.local/bin
ln -s $PWD/src/hmmbuild ~/.local/bin
ln -s $PWD/src/hmmc2 ~/.local/bin
ln -s $PWD/src/hmmconvert ~/.local/bin
ln -s $PWD/src/hmmemit ~/.local/bin
ln -s $PWD/src/hmmerfm-exactmatch ~/.local/bin
ln -s $PWD/src/hmmfetch ~/.local/bin
ln -s $PWD/src/hmmlogo ~/.local/bin
ln -s $PWD/src/hmmpgmd ~/.local/bin
ln -s $PWD/src/hmmpgmd_shard ~/.local/bin
ln -s $PWD/src/hmmpress ~/.local/bin
ln -s $PWD/src/hmmscan ~/.local/bin
ln -s $PWD/src/hmmsearch ~/.local/bin
ln -s $PWD/src/hmmsim ~/.local/bin
ln -s $PWD/src/hmmstat ~/.local/bin
ln -s $PWD/src/jackhmmer ~/.local/bin
ln -s $PWD/src/makehmmerdb ~/.local/bin
ln -s $PWD/src/nhmmer ~/.local/bin
ln -s $PWD/src/nhmmscan ~/.local/bin
ln -s $PWD/src/phmmer ~/.local/bin

cd easel
sudo make
ln -s $PWD/miniapps/easel ~/.local/bin
ln -s $PWD/miniapps/esl-afetch ~/.local/bin
ln -s $PWD/miniapps/esl-alimanip ~/.local/bin
ln -s $PWD/miniapps/esl-alimap ~/.local/bin
ln -s $PWD/miniapps/esl-alimask ~/.local/bin
ln -s $PWD/miniapps/esl-alimerge ~/.local/bin
ln -s $PWD/miniapps/esl-alipid ~/.local/bin
ln -s $PWD/miniapps/esl-alirev ~/.local/bin
ln -s $PWD/miniapps/esl-alistat ~/.local/bin
ln -s $PWD/miniapps/esl-compalign ~/.local/bin
ln -s $PWD/miniapps/esl-compstruct ~/.local/bin
ln -s $PWD/miniapps/esl-construct ~/.local/bin
ln -s $PWD/miniapps/esl-histplot ~/.local/bin
ln -s $PWD/miniapps/esl-mask ~/.local/bin
ln -s $PWD/miniapps/esl-mixdchlet ~/.local/bin
ln -s $PWD/miniapps/esl-reformat ~/.local/bin
ln -s $PWD/miniapps/esl-selectn ~/.local/bin
ln -s $PWD/miniapps/esl-seqrange ~/.local/bin
ln -s $PWD/miniapps/esl-seqstat ~/.local/bin
ln -s $PWD/miniapps/esl-sfetch ~/.local/bin
ln -s $PWD/miniapps/esl-shuffle ~/.local/bin
ln -s $PWD/miniapps/esl-ssdraw ~/.local/bin
ln -s $PWD/miniapps/esl-translate ~/.local/bin
ln -s $PWD/miniapps/esl-weight ~/.local/bin

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
git clone https://github.com/lh3/seqtk.git
cd seqtk
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
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
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv bin/filtlong ~/.local/bin
cd ~/tools
rm -rf Filtlong

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up minimap###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/minimap2.git
cd minimap2
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv minimap2 ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up miniprot###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/miniprot.git
cd miniprot
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
mv miniprot ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bwa###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/bwa.git
cd bwa
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
ln -s $pwd/bwa ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up lastalign###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://gitlab.com/mcfrith/last.git
cd last
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
ln -s $PWD/bin/* ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up bioawk###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/lh3/bioawk.git
cd bioawk
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
cp bioawk ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up trimal###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/inab/trimal.git
cd trimal/source
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
ln -s $PWD/trimal ~/.local/bin
ln -s $PWD/statal ~/.local/bin
ln -s $PWD/readal ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up iqtree3###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/iqtree/iqtree3.git
cd iqtree3
git submodule init
git submodule update
mkdir build
cd build
cmake ..
make 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
ln -s $PWD/iqtree3 ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up muscle5###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/rcedgar/muscle.git
cd muscle/src
#make -j 1 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
chmod +x build_linux.bash
./build_linux.bash
cd ..
ln -s $PWD/bin/muscle ~/.local/bin
cd ~/tools

echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###Setting up FastANI###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tools/"$setup_date"_setup.log
git clone https://github.com/ParBLiSS/FastANI.git
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

wget https://github.com/shenwei356/taxonkit/releases/download/v0.20.0/taxonkit_linux_amd64.tar.gz
tar zxvf taxonkit_linux_amd64.tar.gz
rm taxonkit_linux_amd64.tar.gz
mv taxonkit ~/.local/bin

lftp -c get ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz
tar zxvf taxdump.tar.gz
mkdir -p $HOME/.taxonkit
mv names.dmp nodes.dmp delnodes.dmp merged.dmp $HOME/.taxonkit
rm citations.dmp division.dmp gc.prt gencode.dmp images.dmp readme.txt taxdump.tar.gz

wget https://github.com/shenwei356/seqkit/releases/download/v2.11.0/seqkit_linux_amd64.tar.gz
tar zxvf seqkit_linux_amd64.tar.gz
rm seqkit_linux_amd64.tar.gz
mv seqkit ~/.local/bin

wget https://mmseqs.com/latest/mmseqs-linux-sse41.tar.gz
tar zxvf mmseqs-linux-sse41.tar.gz
ln -s ~/tools/mmseqs/bin/mmseqs ~/.local/bin/mmseqs
rm mmseqs-linux-sse41.tar.gz

git clone https://github.com/mpdunne/alan.git
mv alan/alan ~/.local/bin
rm -rf alan

wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.17.0+-x64-linux.tar.gz
tar zxvf ncbi-blast-2.17.0+-x64-linux.tar.gz
cp ncbi-blast-2.17.0+/bin/* ~/.local/bin
rm -rf ncbi-blast-2.17.0+-x64-linux.tar.gz ncbi-blast-2.17.0+

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

git clone https://github.com/muennich/sxiv.git
cd sxiv
make -j
mv sxiv ~/.local/bin
cd ~/tools
rm -rf sxiv

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
source ~/.bashrc

git clone https://github.com/mbhall88/rasusa.git
cd rasusa
cargo build --release
cargo test --all
cp target/release/rasusa ~/.local/bin/
cd ~/tools
rm -rf rasusa

git clone https://github.com/fulcrumgenomics/fqgrep.git
cd fqgrep
cargo build --release
mv target/release/fqgrep ~/.local/bin
cd ~/tools
rm -rf fqgrep

pipx install pyfaidx
pipx install html2text
pipx install termvisage

curl -fsSL https://install.julialang.org | sh

cat << EOF
#make sure to setup pixi and bioconda/condaforge channel following current setup
#https://bioconda.github.io/
EOF
