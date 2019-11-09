echo "Updating apt repositories";
sudo apt-get update -qq > /dev/null;

echo "Upgrading out of date packages";
sudo apt-get upgrade -qq > /dev/null;

echo "Installing i3";
sudo apt-get install i3 -qq > /dev/null;

echo "Installing git";
sudo apt-get install git -qq > /dev/null;

echo "Installing vim";
sudo apt-get install vim -qq > /dev/null;

echo "Installing xclip";
sudo apt-get install xclip -qq > /dev/null;

echo "Installing terminal profile";
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf;

echo "Installing zsh";
sudo apt-get install zsh -qq > /dev/null;

echo "Setting timezone";
sudo timedatectl set-timezone 'Europe/Amsterdam';
echo "Please check if the date is set correctly!";
date;

echo "Creating link for i3 config";
ln -f ./i3config ~/.config/i3/config;

echo "Creating link for i3status config";
ln -f ./i3status.conf ~/.config/i3/status.conf


