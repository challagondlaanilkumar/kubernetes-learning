#!/bin/bash
apt update

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "++                      AWSCTL INSTALLATION                          ++"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " "
echo "apt remove awscli"
apt remove awscli
echo "========================================================================"
echo "awscli-v2 installation"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
apt install unzip
unzip awscliv2.zip
./aws/install
echo "========================================================================"
echo "aws --version"
aws --version


echo " "
echo " "
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "++                      KUBECTL INSTALLATION                         ++"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " "
echo "kubectl version --client"
kubectl version --client
echo "========================================================================="
echo "Kubernetes 1.28"
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.28.3/2023-11-14/bin/linux/amd64/kubectl
echo "=========================================================================="
echo "Apply execute permissions to the binary."
echo "chmod +x ./kubectl"
chmod +x ./kubectl
echo "=========================================================================="
echo '''Copy the binary to a folder in your PATH. If you have already installed a version of kubectl,
 then we recommend creating a $HOME/bin/kubectl and ensuring that $HOME/bin comes first in your $PATH'''
echo "mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH"
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
echo "==========================================================================="
echo "Add the $HOME/bin path to your shell initialization file so that it is configured when you open a shell"
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
echo "========================================================================"
echo "kubectl version --client"
kubectl version --client



echo " "
echo " "
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "++                      EKSCTL INSTALLATION                          ++"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " "

ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
mv /tmp/eksctl /usr/local/bin
echo "eksctl version"
eksctl version




