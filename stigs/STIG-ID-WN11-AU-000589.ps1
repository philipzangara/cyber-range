<#
.SYNOPSIS
    This PowerShell script configures Windows 11 to audit failure events for Registry access.

.NOTES
    Author          : Philip Zangara
    LinkedIn        : https://www.linkedin.com/in/philip-zangara/
    GitHub          : https://github.com/philipzangara
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000589

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AU-000589.ps1
#>

# Advanced Audit Policy subcategories are managed via auditpol.exe rather than the registry.
$subcategory = "Registry"

auditpol /set /subcategory:"$subcategory" /failure:enable

# Output success message
Write-Host "Audit policy subcategory '$subcategory' configured to log Failure events."
