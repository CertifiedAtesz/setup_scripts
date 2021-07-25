#Create additional folders
cd ~
mkdir Games
mkdir Programs
mkdir Sync

#Configure pacman
cd ~
sudo pacman-mirrors --country Hungary,Austria,Slovakia,Ukraine,Romania,Serbia,Slovenia,Croatia && sudo pacman -Syyu --noconfirm
sudo pacman -Syu --noconfirm

#Install essentials / dependencies (wget, curl, etc.)
cd ~
sudo pacman -Sy --noconfirm git lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader linux-zen wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader lutris meson systemd git dbus syncthing celluloid
sudo flatpak install flathub org.onlyoffice.desktopeditors net.cozic.joplin_desktop -y

#Debloat
cd ~
sudo pacman -R --noconfirm yakuke vlc firefox libreoffice

#Remove Snap, enable AUR and Flathub
cd ~
sudo pacman -R --noconfirm snapd
sudo pacman -S --noconfirm git && cd /opt && sudo git clone https://aur.archlinux.org/yay-git.git && cd yay-git && makepkg -si
sudo pacman -S --noconfirm flatpak && sudo chown -R atesz:atesz ./yay-git

#Install Gamemode and GE-Proton
cd ~
cd Programs
git clone https://github.com/FeralInteractive/gamemode.git && cd gamemode && ./bootstrap.sh
cd .. && mkdir Proton && cd Proton && wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh && sudo chmod +x cproton.sh && ./cproton.sh

#System configuration (KDE - disable sleep mode, disable energy saving)

#Update and Reboot
sudo pacman -Syu --noconfirm
sudo shutdown -r now
