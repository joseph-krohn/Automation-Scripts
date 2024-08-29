<#
.SYNOPSIS
    Removes inactive users from Active Directory.

.DESCRIPTION
    This script identifies users in Active Directory who have been inactive for a specified number of days 
    and removes them. The process is logged to a specified file.

.PARAMETER DaysInactive
    The number of days a user must be inactive before being removed. Default is 90 days.

.PARAMETER LogFilePath
    The file path where the log will be saved. Default is "C:\Logs\UserCleanup.log".

.EXAMPLE
    .\Invoke-UserCleanup.ps1 -DaysInactive 90 -LogFilePath "C:\Logs\UserCleanup.log"

.NOTES
    Author: Joseph Krohn
    License: MIT License
    Version: 1.0.0
    Dependencies: Active Directory Module
#>

param (
    [int]$DaysInactive = 90,
    [string]$LogFilePath = "C:\Logs\UserCleanup.log"
)

# Ensure the Active Directory module is available
if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Error "The Active Directory module is not available."
    exit 1
}

Import-Module ActiveDirectory
Import-Module "$PSScriptRoot\utils\Logging.psm1"

# Log start
Write-Log -Message "Starting user cleanup. Removing users inactive for $DaysInactive days." -LogFilePath $LogFilePath

# Find inactive users
$inactiveUsers = Get-ADUser -Filter {La
