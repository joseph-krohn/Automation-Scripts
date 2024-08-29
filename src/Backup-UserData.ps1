<#
.SYNOPSIS
    Backs up user data to a specified location.

.DESCRIPTION
    This script backs up specified user data directories to a target backup location. It logs 
    the status of the backup process to a specified log file.

.PARAMETER UserDirectories
    The directories of user data to be backed up.

.PARAMETER BackupLocation
    The location where the backups will be stored.

.PARAMETER LogFilePath
    The file path where the log will be saved. Default is "C:\Logs\BackupUserData.log".

.EXAMPLE
    .\Backup-UserData.ps1 -UserDirectories "C:\Users\User1","C:\Users\User2" -BackupLocation "D:\Backups" -LogFilePath "C:\Logs\BackupUserData.log"

.NOTES
    Author: Joseph Krohn
    License: MIT License
    Version: 1.0.0
#>

param (
    [string[]]$UserDirectories,
    [string]$BackupLocation,
    [string]$LogFilePath = "C:\Logs\BackupUserData.log"
)

Import-Module "$PSScriptRoot\utils\Logging.psm1"

# Ensure the backup location exists
if (-not (Test-Path $BackupLocation)) {
    New-Item -Path $BackupLocation -ItemType Directory -Force
    Write-Log -Message "Backup location created at $BackupLocation" -LogFilePath $LogFilePath
}

# Log start
Write-Log -Message "Starting backup for user data." -LogFilePath $LogFilePath

# Loop through each user directory and back it up
foreach ($dir in $UserDirectories) {
    $targetDir = Join-Path -Path $BackupLocation -ChildPath (Split-Path -Leaf $dir)
    try {
        Copy-Item -Path $dir -Destination $targetDir -Recurse -Force
        Write-Log -Message "Successfully backed up $dir to $targetDir" -LogFilePath $LogFilePath
    } catch {
        Write-Log -Message "Failed to back up $dir. Error: $_" -LogFilePath $LogFilePath
    }
}

# Log completion
Write-Log -Message "User data backup completed." -LogFilePath $LogFilePath
