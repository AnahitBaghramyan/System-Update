#!/bin/bash

echo "Auto-Updater"

if [ "$EUID" -ne 0 ]; then
  echo "PLEASE RUN AS ROOT"
  exit 1
fi

echo "Preliminary Check: Successful"

# Setting-Up Auto Updater
echo "Setting up script to run with Startup"
echo -e "[Unit]\nDescription=Auto-Updater\n\n[Service]\nExecStart=/bin/bash -c '/usr/local/sbin/updater.sh'\n\n[Install]\nWantedBy=default.target" > /etc/systemd/system/updater.service

# Enable updater.service : Starting the updater service automatically during system boot
systemctl enable updater.service

# Pre-Configuring Packages: Ensuring that the package configuration process is completed
dpkg --configure -a

# Fix & Attempt Broken Dependencies: Installing or removing packages
apt-get install -f -y

# Update Cache: Downloading the latest information about available packages and versions
apt update -y

# Upgrade Packages: Upgrading all installed packages to their latest available versions
apt upgrade -y

# Upgrade Distro: Changing dependencies with new versions of packages
apt dist-upgrade -y

# Uninstall Unused Packages: Removing packages that are no longer needed
apt --purge autoremove -y

# Clean Up: Removing old package files from the local repository cache
apt autoclean -y

echo "Complete"
