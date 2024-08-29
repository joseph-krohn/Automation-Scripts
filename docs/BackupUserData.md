# Backup-UserData.ps1

## Overview

`Backup-UserData.ps1` is a PowerShell script designed to automate the backup of user data from specified directories to a designated backup location. This script is useful for ensuring that critical user data is safely stored in a backup location, which can be restored in case of data loss.

## Parameters

- **UserDirectories**: 
  - **Type:** String array
  - **Description:** The directories of user data that need to be backed up. You can specify multiple directories by separating them with commas.
  - **Example:** `-UserDirectories "C:\Users\User1", "C:\Users\User2"`

- **BackupLocation**: 
  - **Type:** String
  - **Description:** The directory where the backups will be stored. The script will create the backup directory if it does not exist.
  - **Example:** `-BackupLocation "D:\Backups"`

- **LogFilePath**: 
  - **Type:** String
  - **Description:** The file path where the log will be saved. If not specified, the default is `"C:\Logs\BackupUserData.log"`.
  - **Example:** `-LogFilePath "C:\Logs\BackupUserData.log"`

## Usage

To run the script, open a PowerShell terminal and navigate to the directory containing the script. Then execute the script with the appropriate parameters:

```powershell
.\Backup-UserData.ps1 -UserDirectories "C:\Users\User1","C:\Users\User2" -BackupLocation "D:\Backups" -LogFilePath "C:\Logs\BackupUserData.log"
