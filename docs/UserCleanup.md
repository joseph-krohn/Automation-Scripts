# Invoke-UserCleanup.ps1

## Overview

`Invoke-UserCleanup.ps1` is a PowerShell script designed to automate the cleanup of inactive users in Active Directory. The script identifies users who have not logged on for a specified number of days and removes them from Active Directory.

## Parameters

- **DaysInactive**: The number of days a user must be inactive before being removed. Default is 90 days.
- **LogFilePath**: The file path where the log will be saved. Default is `C:\Logs\UserCleanup.log`.

## Usage

To run the script:

```powershell
.\Invoke-UserCleanup.ps1 -DaysInactive 90 -LogFilePath "C:\Logs\UserCleanup.log"
