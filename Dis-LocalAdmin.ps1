<# Description
Reset and Disabled local admin user

Task: Create a script that performs the following operations:
1. Resets the local administrator (Windows) 
2. Disables the local administrator (Windows)
3. Logs the process, including start time, end time, and actions taken, to a file named account_management_log.txt.

Name:         Dis-LocalAdmin.ps1
Date:         06/12/2024
By:           Daniel Zumaya 
Description:  Script was created to reset the password for a specific local admin and disable it
Dependencies: PoSH console should be execute as administrator to execute the Script
Comments:     Log file will be save it on the same where the script is located and 
#>

#Variable Regions
$LogPath = ".\account_management_log.txt"

# Loggin Function
function Write-log {
    param (
        [string] $message
        )
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "$timestamp - $message"
        Write-Output $logMessage | Out-File $LogPath -Append -Force
    }

Write-log "Script is running!..." 

#Task 1
Write-log "Changing password..." 
$UserName = Read-Host -Prompt "`r`nEnter user for Password Reset" 
$Password =  Read-Host -Prompt "`r`nEnter the new password" -AsSecureString 
Set-LocalUser $UserName -Password $Password
Write-log "Password sucessfully changed" 

#Task 2
Disable-LocalUser $UserName
Write-log "the user Was disabled Successfully"
Write-Host "The User was disabled and password was change it" -ForegroundColor Red