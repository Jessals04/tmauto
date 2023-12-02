#!/bin/zsh

# Target disk volume name
DISK_VOLUME_NAME="Time Machine"

# Get the device identifier for the target volume
DISK_IDENTIFIER=$(diskutil info "$DISK_VOLUME_NAME" | awk '/Device Identifier/ {print $3}')

# Check if the DISK_IDENTIFIER is not empty (meaning the disk is mounted)
if [[ -n "$DISK_IDENTIFIER" ]]; then
    echo "Disk $DISK_VOLUME_NAME is mounted. Starting Time Machine backup."

    # Start Time Machine backup
    tmutil startbackup --block

    # Monitor Time Machine backup progress
    while [[ $(tmutil currentphase) != "BackupNotRunning" ]]; do
        echo "Backup in progress..."
        sleep 5
    done

    echo "Backup complete. Ejecting disk $DISK_VOLUME_NAME."

    # Eject the disk after the backup completes
    diskutil eject "$DISK_IDENTIFIER"
else
    echo "Disk $DISK_VOLUME_NAME is not mounted or does not exist."
fi
