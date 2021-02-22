#!/bin/bash
# Install Git latest version on RHEL flavours
# Download this script or use git clone then run regular shell script execution
# ./gitinstall.sh
# Created: 20-Feb-2021
# 

VER=2.30.1
# prerequisites
echo "Install dependencies"
yum install -y wget \
curl-devel expat-devel gettext-devel openssl-devel zlib-devel \
gcc perl-ExtUtils-MakeMaker
cd /opt
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-${VER}.tar.gz

echo "Check git installed version after dependencies installed..."
git --version
if [ $? -eq 0 ]; 
then
    #remove the default git version from yum repo
    echo "Removal of old version of git"
    yum remove git -y
fi

# extract the git tarball
echo "Extracting git installer"
tar -zxf git-${VER}.tar.gz
cd git-${VER}

# installing latest version of git 
echo "Compile and install git latest version"
make prefix=/usr/local/git all
make prefix=/usr/local/git install

# set the global path
echo "Adding to PATH"
echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/bashrc
source /etc/bashrc
 
git --version | grep ${VER}
[ $? -eq 0 ] && echo "Git installed latest version successfully"

# clean up
echo "Clean up the git installer stuff"
cd /opt; rm -rf git-${VER} git-${VER}.tar.gz
