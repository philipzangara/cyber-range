<#
.SYNOPSIS
    This PowerShell script disables the Windows Installer 'Always install with elevated privileges' setting on Windows 11.

.NOTES
    Author          : Philip Zangara
    LinkedIn        : https://www.linkedin.com/in/philip-zangara/
    GitHub          : https://github.com/philipzangara
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000315.ps1
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$valueName = "AlwaysInstallElevated"
$valueData = 0  # 0 = Disabled (standard users cannot install with elevated privileges)

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the AlwaysInstallElevated value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."
