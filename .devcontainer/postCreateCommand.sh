#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

# echo "** Installing Amazon Q Developer CLI **"
# curl --proto '=https' --tlsv1.2 -sSf "https://desktop-release.q.us-east-1.amazonaws.com/latest/q-$(uname -m)-linux.zip" -o "q.zip"
# unzip q.zip
# ./q/install.sh
# rm -rf q.zip q


echo "** Installing Node.js and npm **"
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs
sudo apt-get install -y nodejs
sudo apt-get install nsolid -y 

echo "** Installing uv **"
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "** Installing Graphviz **"
sudo apt-get update && sudo apt-get install -y graphviz

echo "** Installing Python 3.10**"
uv python install 3.10

echo "** Creating virtual environment using Python 3.10 **"
uv venv -p 3.10
source .venv/bin/activate

echo "** Execute 'source '.venv/bin/activate' to activate the virtual environment **"
