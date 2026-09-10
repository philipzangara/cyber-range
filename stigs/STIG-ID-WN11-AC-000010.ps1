    <#
.SYNOPSIS
    This PowerShell script configures the Windows 11 account lockout threshold to 3 invalid logon attempts.

.NOTES
    Author          : Philip Zangara
    LinkedIn        : https://www.linkedin.com/in/philip-zangara/
    GitHub          : https://github.com/philipzangara
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010

.TESTED ON
    Date(s) Tested  : 2026-09-08
    Tested By       : Philip Zangara
    Systems Tested  : Microsoft Windows 11 Pro 10.0.26200
    PowerShell Ver. : 5.1

.USAGE
    PS C:\> .\STIG-ID-WN11-AC-000010.ps1
#>

# Account lockout threshold is part of Account Policy and is set via the local security
# database, most reliably with net.exe on non-domain-controller systems.
# Requirement: 3 or fewer invalid logon attempts, but not 0 (0 disables lockout entirely).

$lockoutThreshold = 3

net accounts /lockoutthreshold:$lockoutThreshold

# Output success message
Write-Host "'Account lockout threshold' set to $lockoutThreshold invalid logon attempts."
