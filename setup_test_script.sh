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
echo "           SCRIPT UPDATED - APR 12 2023           "
echo "                                                  "
echo "##################################################"

cd

mkdir ~/tests
cd ~/tests
mkdir bin
touch "$setup_date"_setup.log

echo "###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###Setting up bedtools2###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
git clone https://github.com/arq5x/bedtools2
cd bedtools2
make 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
cp bin/* ~/tests/bin
cd ~/tests

echo "###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###Setting up samtools###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
git clone https://github.com/samtools/samtools
cd samtools
autoheader
autoconf -Wno-syntax
./configure 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
make 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
cp samtools ~/tools/bin
cd ~/tools
rm -rf samtools

echo "###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###Setting up hmmer###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
wget http://eddylab.org/software/hmmer/hmmer.tar.gz
tar zxvf hmmer.tar.gz
rm hmmer.tar.gz
cd hmmer-3.3.2
./configure 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
make 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
cd ~/tests
rm -rf hmmer-3.3.2

echo "###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###Setting up minimap###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
git clone https://github.com/lh3/minimap2
cd minimap2
make 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
mv minimap2 ~/tests/bin
cd ~/tests
rm -rf minimap2


echo "##################################################" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "##################################################" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "##################################################" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "## You might want to add below paths to .bashrc ##" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "                                                  " 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo 'export PATH=${PATH}:$HOME/tools/bin               ' 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo 'export PATH=${PATH}:$HOME/.local/bin              ' 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "                                                  " 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###### Also consider installing pandoc via  ######" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "##### https://github.com/jgm/pandoc/releases #####" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "                                                  " 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "######## And consider bioconda setup from ########" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###### conda config --add channels defaults ######" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "###### conda config --add channels bioconda ######" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
echo "#### conda config --add channels conda-forge #####" 2>&1 | tee -a ~/tests/"$setup_date"_setup.log
