#!/bin/bash

# Task 3 ***

# Log file path
LOG_FILE="/var/log/account_management.log"

# log messages
log_message() {
   echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
  }
 
# checking privileges to execution as root
if  [ "$(id -u)" != "0" ]; then 
    echo "This script must be run as root..." | tee -a "$LOG_FILE"
    exit 1
fi

log_message "Starting process..."

# Task 1 ***

# Password Reset
reset_password() {
   echo "Resetting root password..."
   passwd root
if [ $? -eq 0 ]; then
   log_message "Root password reset was successfully."
 else
   log_message "Password reset failed."
   exit 1
fi
}

# Task 2 ***

# Disabling root user
disabling_root() {
   echo "Disabling root user..."
usermod -L root
if [ $? -eq 0 ]; then
 log_message "Root account was disabled successfully"
else
 log_message "Failed to disable root account"
  exit 1
fi
}

# Reset root password
reset_password

# Disable root user
disabling_root

log_message "Process completed."

echo "Script completed successfully"