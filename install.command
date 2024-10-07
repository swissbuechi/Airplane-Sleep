#!/bin/zsh
clear
echo "================================================================================"
echo "              Airplane-Sleep Installer v1.0 by swissbuechi"
echo "================================================================================"
echo " This installer only installs trusted Homebrew packages along with the custom "
echo " configuration files for toggling bluetooth and wifi during sleep-mode."
echo "================================================================================"; 
echo
vared -p "> Install packages and configurations? (y|n): " -c tmp

if [[ $(ps -o comm= $PPID) = iterm ]]; then
	stty erase '^?'
fi

while [[ "$tmp" != "y" && "$tmp" != "Y" && "$tmp" != "n" && "$tmp" != "N" ]]; do
	unset tmp
	vared -p " > Please enter 'y' for yes or 'n' for no. (y|n): " -c tmp
	
	if [[ $(ps -o comm= $PPID) = iterm ]]; then
		stty erase '^?'
	fi
done

if [[ "$tmp" == "y" || "$tmp" == "Y" ]]; then
	unset tmp
	echo
	echo "================================================================================"
	echo " > Checking for Homebrew"
	echo "================================================================================"; 
	
	[ ! -f "`which brew`" ] && echo "> Homebrew is not installed."
	[ ! -f "`which brew`" ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	
	
	[ ! -f "`which brew`" ] && echo "> Homebrew is still not installed! "
	[ ! -f "`which brew`" ] && echo ">  Please manually install Homebrew. Exiting..." && sleep 3 && exit
	
	echo
	echo $(which brew)
	
	echo; 
	echo "================================================================================"
	echo " > Installing Homebrew packages"
	echo "================================================================================"; 
	echo
	brew install blueutil
	brew install sleepwatcher
	
	echo; 
	echo "================================================================================"
	echo " > Installing configuration files"
	echo "================================================================================"; 
	echo
	cp $(dirname "$0")/.sleep ~/
	echo ">" sleep config stored to ~/.sleep
	
	chmod +x ~/.sleep; echo "> .sleep is now executable! "
	
	cp $(dirname "$0")/.wakeup ~/
	echo ">" wakeup config stored to ~/.wakeup
	
	chmod +x ~/.wakeup; echo "> .wakeup is now executable! "
	
	
	echo; 
	echo "================================================================================"
	echo " > Initializing sleepwatcher service..."
	echo "================================================================================"; 
	echo
	
	brew services start sleepwatcher
	
	echo; 
	echo "================================================================================"
	echo "> Installation is complete! "
fi

unset tmp

echo; 
echo "> Now exiting installer..."

exit
