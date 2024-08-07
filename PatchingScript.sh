#!/bin/bash

#Log file path
Patching_log="/var/log/patch_log.log"

#Login function
log_message() {
   echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a $Patching_log
}
   
# 1 Checking updates available
log_message "Checking updates available... please wait!"
sudo apt-get update > /dev/null 2>&1
AVAILABLE_UPDATES=$(apt list --upgradable 2>/dev/null)

if [ -z "$AVAILABLE_UPDATES" ]; then
    log_message "No updates were found.."
else
    log_message "the following updates were found"
    echo "$AVAILABLE_UPDATES" | tee -a $Patching_log
fi

# 2 Install all the updates available and create a log
log_message "Starting updates installation."
sudo apt-get upgrade -y >> $Patching_log 2>&1

if [$? -eq 0]; then
    log_message "Updates installed successfully."
else
    log_message "Error occurred during updates installation."
fi

    log_message "Updates process completed."