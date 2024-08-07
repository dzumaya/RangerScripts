<# Description
Directory Reporting Script

Task: Create a script that performs the following operations:
1. Accepts a directory path as an argument.
2. Lists all files in the directory.
3. For each file, output the file name, size, and last modified date.
4. Save the output to a text file named directory_report.txt in the specified directory.

Name:         DirReport.ps1
Date:         06/08/2024
By:           Daniel Zumaya 
Description:  Directory Reporting Script
Dependencies: No dependencies
Comments:     Log file will be save it on the same location entered as a folder path 
#>


#Variable Regions
$LogPath = ".\directory_report.txt"

# Loggin Function
function Write-log {
    param (
        [string] $message
        )
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "$timestamp - $message"
        Write-Output $logMessage | Out-File $DirPath\$LogPath -Append -Force
    }

Write-Host "Script running... Getting information" -ForegroundColor Cyan

# 1 Access directory path as an argument:
$DirPath = Read-Host -Prompt "`r`nPlease enter the directory path to create the report"

# 2 getting content from the path directory
Write-log "Getting content listed"
$OutPut =Get-ChildItem -Recurse $DirPath 
$OutPut| Out-File $DirPath\$LogPath -Append -Force 

# 3 listing file name, size and last modification:
Write-log "Contenlisted with details as per the request"
$OutPut | Select-Object FullName,Length,LastWriteTime | Out-File $DirPath\$LogPath -Append -Force 

Write-Host "`r`nTask Completed..." -ForegroundColor Green

