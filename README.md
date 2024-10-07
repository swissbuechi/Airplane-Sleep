# Airplane-Sleep (macOS)
Disable wifi and bluetooth when closing your MacBook or putting it to sleep!

## Features
Here's a few simple commands that might help with saving battery life. The configuration files should work on other versions of macOS, but I have not tested it yet myself.  Apparently wifi and bluetooth are still active when the MBP is closed and if you have something like Dropbox running, it could contribute to significant power drain.  Turning the antennas off can save battery and prevent some data from being transferred during sleep mode.

## Installation

1. Donwload or clone the repository

```bash
chmod +x ./install.command
```

1. Allow the installer to everything.  You may be asked to change security preferences for "input monitoring" on your MacBook to allow the Homebrew package "sleepwatcher" to function properly.

Now when the computer sleeps, it will automatically disable wifi if it's on and bluetooth if it's on as well.

## Uninstallation

1. Open Terminal and type in

```bash
chmod +x /Volumes/Airplane-Sleep/uninstall.command
```

2. Double-click on the uninstall.command file.

3. Allow the uninstaller to remove what ever you want from what was installed.


## Manual Installation

<details>
  <summary>Click to expand!</summary>
  
  1. Run command on Terminal to install the Homebrew package manager.
  
  ```bash
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```
  
  2. Install command-line tools for controling bluetooth and executing sleep commands.  You may be asked to change security preferences for "input monitoring" on your MacBook to allow sleepwatcher to function properly.
  
  ```bash
  brew install blueutil
  brew install sleepwatcher
  brew services start sleepwatcher
  ```
  
  3. Move the hidden files ".sleep" and ".wakeup" from the .dmg into your user home directory.  Initialize file for ".bluestatus" and ".wifistatus".  Change permissions for each file.
  
  ```bash
  cp /Volume/Airplane-Sleep/.sleep ~/
  cp /Volume/Airplane-Sleep/.wakeup ~/
  
  chmod +x ~/.sleep
  chmod +x ~/.wakeup
  ```
</details>

## Manual Uninstallation
<details>
  <summary>Click to expand!</summary>
  
  1. Uninstallation of configuration files.
  
  ```bash
  rm -rf ~/.sleep
  rm -rf ~/.wakeup
  ```
  
  2. Uninstallation of Homebrew packages.
  
  ```bash
  brew remove blueutil
  brew services stop sleepwatcher
  brew remove sleepwatcher
  ```
  
  3. Uninstallation of Homebrew (optional).
  
  ```bash
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
  ```
  </details>

## Sidenote

Hibernation is a super useful feature, especially with fast SSDs.  It might also be worth changing the sleep standby delay before hibernation.  These commands change the delay after sleeping to entering hibernation when on low power to 10 minutes (600 sec) and when on high power to 20 minutes (1200 sec).


```bash
sudo pmset -a standbydelaylow 600
sudo pmset -a standbydelayhigh 1200
```
