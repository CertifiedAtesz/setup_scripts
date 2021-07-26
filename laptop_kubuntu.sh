#Pre-Setup update
sudo apt update && sudo apt upgrade -y

#Create additional folders
cd ~
mkdir Games
mkdir Programs
mkdir Projects

#Remove Snap, enable AUR and Flathub
cd ~
sudo apt purge -y snapd
sudo apt install -y flatpak gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Install essentials / dependencies (wget, curl, etc.)
cd ~
sudo add-apt-repository ppa:lutris-team/lutris
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y libsm6:i386 git wget curl lutris celluloid brave-browser apt-transport-https gparted
flatpak install -y flathub net.cozic.joplin_desktop com.visualstudio.code org.onlyoffice.desktopeditors

#Debloat
sudo apt purge -y vlc thunderbird firefox partitionmanager

#Install Gamemode and GE-Proton
cd ~
cd Programs
git clone https://github.com/FeralInteractive/gamemode.git && cd gamemode && ./bootstrap.sh
cd .. && mkdir Proton && cd Proton && wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh && sudo chmod +x cproton.sh && ./cproton.sh

#Setup Sync folders and config for Syncthing
cd Projects && mkdir Github && mkdir .stfolder && touch .stignore
sudo echo '!\Github' >> .stignore && sudo echo "**" >> .stignore

#Update and Reboot
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
sudo shutdown -r now
