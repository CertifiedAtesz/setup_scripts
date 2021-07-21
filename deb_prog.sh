#   The following script is written for a Minimal install for the Kubuntu flavour
#   Feel free to edit these entries at your convenience 
#
#
#
#
#
# 0.      Update system
sudo apt update
sudo apt upgrade -y
#
# 1.      Debloat stage
sudo apt autoremove --purge -y firefox vlc libreoffice kmail partitionmanager

# 2.    Swap Snap with Flathub
sudo apt autoremove --purge -y snapd
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# 2.1.    Additional repositories
# 2.2.1.  Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# 2.3.2.  Celluloid
sudo add-apt-repository ppa:xuzhen666/gnome-mpv

# 2.3.3.  OnlyOffice
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
echo 'deb https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list

# 2.3.4.  Python
sudo add-apt-repository ppa:deadsnakes/ppa,

# 2.3.4.  VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg


# 3.    Install software dependencies
sudo apt update
sudo apt install -y apt-transport-https curl postgresql software-properties-common default-jre dpkg


# 4.    Install softwares
sudo apt install -y brave-browser celluloid onlyoffice-desktopeditors gparted python wget ufw
flatpak install flathub org.eclipse.Javascript
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb


# 5.    Enable firewall
sudo ufw enable


# 6.    Cleanup and Reboot
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo shutdown -r now
