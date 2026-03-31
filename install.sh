#!/bin/bash
INSTALLER_DIR=$(cd "$(dirname "$0")" && pwd)

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}=========================================${NC}"
echo -e "${GREEN}         INSTALLING BYPASS SCRIPT        ${NC}"
echo -e "${CYAN}=========================================${NC}"
echo ""

echo -e "${BLUE}[1/4] Updating packages...${NC}"
pkg update -y && pkg upgrade -y
echo -e "${GREEN}[✓] Packages updated${NC}"

echo ""
echo -e "${BLUE}[2/4] Installing required packages...${NC}"
pkg install python git python-pip -y
pip install requests ping3 pycryptodome
echo -e "${GREEN}[✓] Python, Git, Pip installed${NC}"

echo ""
echo -e "${BLUE}[3/4] Cloning repository...${NC}"
cd ~
git clone https://github.com/MINTHUKYAW387/qwertyuiopasdfghjklzxcvbnm1234567890.git
echo -e "${GREEN}[✓] Repository cloned${NC}"

echo ""
echo -e "${BLUE}[4/4] Setting up auto-run...${NC}"
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
fi
sed -i '/cd ~\/qwertyuiopasdfghjklzxcvbnm1234567890 && python rebp.py/d' ~/.bashrc
echo "" >> ~/.bashrc
echo "cd ~/qwertyuiopasdfghjklzxcvbnm1234567890 && python rebp.py" >> ~/.bashrc

if [ ! -f ~/.bash_profile ]; then
    touch ~/.bash_profile
fi
sed -i '/cd ~\/qwertyuiopasdfghjklzxcvbnm1234567890 && python rebp.py/d' ~/.bash_profile
echo "cd ~/qwertyuiopasdfghjklzxcvbnm1234567890 && python rebp.py" >> ~/.bash_profile
echo -e "${GREEN}[✓] Auto-run configured${NC}"

echo ""
echo -e "${CYAN}=========================================${NC}"
echo -e "${GREEN}     INSTALLATION COMPLETED SUCCESSFULLY${NC}"
echo -e "${CYAN}=========================================${NC}"
echo ""
echo -e "${YELLOW}Please restart Termux to apply changes.${NC}"

cd ~
rm -f "$INSTALLER_DIR/install.sh"
