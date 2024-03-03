# Auto-Updater Script

## Description
This Bash script automates the update process for a Debian-based Linux system. It performs essential system updates, upgrades packages, and cleans up unnecessary files. Additionally, it sets up an automatic updater service to run at startup.

## Usage

### Prerequisites
- This script is intended for Debian-based Linux distributions.
- Ensure you have root privileges to run the script.

### Running the Script
1. Open a terminal.
2. Navigate to the directory containing the script.
3. Run the following command:
sudo bash updater.sh
4. Follow the on-screen instructions.

### Auto-Updater Service
The script sets up a systemd service for automatic updates during system boot. The service can be enabled or disabled using the following commands:

- Enable Auto-Updater service:
sudo systemctl enable updater.service

- Disable Auto-Updater service:
sudo systemctl disable updater.service
