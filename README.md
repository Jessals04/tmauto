# tmauto
A LaunchAgent and zsh script that work together to start a Time Machine backup when a specific disk is mounted and unmount that disk once the backup is complete.

## Setup Guide
1. Download the .zsh file and place it in a folder such as `username/Developer/Scripts/`.
2. Update `DISK_VOLUME_NAME="Time Machine"` in the script to match the name of your external drive as seen in Finder.
3. Make the script executable: `chmod +x path/to/tmauto.zsh`.
4. Download the .plist file and place it in `~/Library/LaunchAgents/`.
5. Load the Launch Agent: `launchctl load ~/Library/LaunchAgents/com.jessejwatson.tmauto.plist` or `launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.jessejwatson.tmauto.plist`.

## Feedback
This is just a simple script and works great for me. If there is anything you'd like to add DM me [**@jessals04**](www.x.com/jessals04) on X.
