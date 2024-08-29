
function Write-Log {
    param (
        [string]$Message,
        [string]$LogFilePath
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp - $Message"
    Add-Content -Path $LogFilePath -Value $logMessage
}
