# External repositories
sudo add-apt-repository ppa:webupd8team/sublime-text-3

# Update/upgrade
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Package installation
sudo apt-get install -y --force-yes \
	chromium-browser \
	cmake \
	emacs24 \
	encfs \
	fontconfig \
	g++ \
	gcc \
	git \
	gitk \
	gnupg \
	ipython3 \
	kazam \
	mtpaint \
	openssh-client \
	openssh-server \
	openssl \
	pep8 \
	pylint \
	python3 \
	python3-crypto \
	python3-numpy \
	python3-pandas \
	python3-pip \
	python3-requests \
	python3-setuptools \
	scala \
	sqlite3 \
	sublime-text-installer \
	tig \
	tmux \
	unrar \
	vim \
	virtualbox \
	virtualbox-guest-additions-iso \
	vlc \
	xfce4-terminal \
	xfonts-terminus \
	zsh




# If we are inside VirtualBox, add current user to VBox groups
SYSTEMNAME=`sudo dmidecode -s system-product-name`
if [ "$SYSTEMNAME" = "VirtualBox" ]; then
	sudo adduser $USER vboxusers
	sudo adduser $USER vboxsf
fi

# Fonts
mkdir ~/.fonts
cp -a ./data/fonts/* ~/.fonts/

# Xfce configuration
xfconf-query --channel xfce4-panel --property "/panels/panel-0/mode" --set 2
xfconf-query --channel xfce4-panel --property "/panels/panel-0/size" --set 64
xfconf-query --channel xfce4-keyboard-shortcuts --property "/xfwm4/custom/<Super>Down" --create --type string --set "tile_down_right_key"
xfconf-query --channel xfce4-keyboard-shortcuts --property "/xfwm4/custom/<Super>Left" --create --type string --set "tile_left_key"
xfconf-query --channel xfce4-keyboard-shortcuts --property "/xfwm4/custom/<Super>Right" --create --type string --set "tile_right_key"
xfconf-query --channel xfce4-keyboard-shortcuts --property "/xfwm4/custom/<Super>Up" --create --type string --set "tile_up_right_key"
cp -r ./data/terminal ~/.config/xfce4/

# Emacs config
git clone https://github.com/vurmux/.emacs.d.git
rm ~/.emacs
rm -rf ~/.emacs.d
mv .emacs.d ~

# Sublime text config
mkdir -p ~/.config/sublime-text-3/Packages/User
cp ./data/sublime-text/crazyfruits.tmTheme ~/.config/sublime-text-3/Packages
cp ./data/sublime-text/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User

echo "Finished!"
