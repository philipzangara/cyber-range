<#
.SYNOPSIS
    This PowerShell script disables Internet Explorer 11 as a standalone browser on Windows 11.

.NOTES
    Author          : Philip Zangara
    LinkedIn        : https://www.linkedin.com/in/philip-zangara/
    GitHub          : https://github.com/philipzangara
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000391

.TESTED ON
    Date(s) Tested  : 2026-09-08
    Tested By       : Philip Zangara
    Systems Tested  : Microsoft Windows 11 Pro 10.0.26200
    PowerShell Ver. : 5.1

.USAGE
    PS C:\> .\STIG-ID-WN11-CC-000391.ps1
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main"
$valueName = "NotifyDisableIEOptions"
$valueData = 0  # 0 = Never (disables IE11 as a standalone browser without notifying users)

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the NotifyDisableIEOptions value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."