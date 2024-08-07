<#Description
System Patching Script

Task: Create a script that performs the following operations:
1. Checks for available system updates/patches.
2. Lists the updates/patches that are available.
3. Applies the updates/patches.
4  Logs the update process, including start time, end time, and the list of applied updates, to a file named patch_log.txt


Name:         SystemPatch.ps1
Date:         Started 06/04/2024
By:           Daniel Zumaya 
Description:  System Patching Script
Dependencies: PSWindowsUpdate module
Comments:     NA
Log:          Started 06/04/2024
#>

#Region Variables
$ErrorActionPreference = 'SilentlyContinue'
$PatchingLog = ".\Patch_log.log"
$UpdateLog = "C:\Windows\Logs\WindowsUpdate\"
$lastETL = gci $UpdateLog | select -Last 1


#Checking module Availability and PackageProvider
Get-PackageProvider -Name NuGet -ForceBootstrap -
Install-Module PSWindowsUpdate -Confirm:$false -Force

#Check Available Patches and show them listed
Get-WUList | Out-File $PatchingLog -Force -Append 
Install-WindowsUpdate -KBArticleID KB4052623  -AcceptAll -IgnoreReboot | Out-File $PatchingLog -Force -Append


#Saving the logs
#Write-Output $lastETL

Notes: pending to execute installation just from a KB to see if the script works and save everything, 
pending find the way to convert just one etl file into a log file and save it in a specific location 