<#
.SYNOPSIS
    This PowerShell script configures Windows 11 password history to remember at least 24 passwords.

.NOTES
    Author          : Philip Zangara
    LinkedIn        : https://www.linkedin.com/in/philip-zangara/
    GitHub          : https://github.com/philipzangara
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000020

.TESTED ON
    Date(s) Tested  : 2026-09-08
    Tested By       : Philip Zangara
    Systems Tested  : Microsoft Windows 11 Pro 10.0.26200
    PowerShell Ver. : 5.1

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AC-000020.ps1
#>

# Password history ("Enforce password history") is part of Account Policy and is set
# via the local security database, most reliably with net.exe on non-domain-controller systems.

$passwordHistorySize = 24

net accounts /uniquepw:$passwordHistorySize

# Output success message
Write-Host "'Enforce password history' set to remember $passwordHistorySize passwords."
