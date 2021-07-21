#   The following script is written for a Minimal install for Manjaro
#   Feel free to edit these entries at your convenience 
#   AMD system-optimised
#
#
#
#
# 0.    Update system
sudo pacman-mirrors --country Hungary,Austria,Slovakia,Ukraine,Romania,Serbia,Slovenia,Croatia && sudo pacman -Syyu --noconfirm
sudo pacman -Syu --noconfirm

# 1.    Debloat stage
sudo pacman -R --noconfirm
# 2.    Swap Snap with Flathub
sudo pacman -R snapd
sudo pacman -S flatpak
sudo chown -R atesz:atesz ./yay-git

# 3.    Enable AUR
sudo pacman -S --noconfirm git
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

# 4.    Install softwares
sudo add-apt-repository ppa:kisak/kisak-mesa -y
sudo apt update
sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386 -y
sudo pacman -S --nocinfirm lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader 
sudo pacman -S --noconfirm linux-zen -y
sudo pacman -S --nocinfirm wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader lutris -y
sudo pacman -S --noconfirm meson systemd git dbus
git clone https://github.com/FeralInteractive/gamemode.git
cd gamemode
./bootstrap.sh
cd ~
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
sudo chmod +x cproton.sh
./cproton.sh

# 5.    Cleanup and Reboot
sudo shutdown -r now
