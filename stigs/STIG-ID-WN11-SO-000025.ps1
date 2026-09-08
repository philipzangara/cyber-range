<#
.SYNOPSIS
    This PowerShell script renames the built-in Guest account on Windows 11 so it is no longer identifiable as 'Guest'.

.NOTES
    Author          : Philip Zangara
    LinkedIn        : https://www.linkedin.com/in/philip-zangara/
    GitHub          : https://github.com/philipzangara
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000025

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Update $newGuestName below to a site-approved value before running (any name other than "Guest").
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000025.ps1
#>

# The built-in Guest account (well-known RID 501) must be renamed to something other than "Guest".
# Update this value to your organization's approved naming convention before running.
$newGuestName = "Guest_Disabled"

# Identify the built-in Guest account by its well-known SID pattern (...-501), in case it has
# already been renamed previously or the locale-specific default name differs.
$guestAccount = Get-LocalUser | Where-Object { $_.SID -like "S-1-5-21-*-501" }

if ($guestAccount) {
    if ($guestAccount.Name -ne $newGuestName) {
        Rename-LocalUser -Name $guestAccount.Name -NewName $newGuestName
        Write-Host "Built-in Guest account renamed from '$($guestAccount.Name)' to '$newGuestName'."
    } else {
        Write-Host "Built-in Guest account is already named '$newGuestName'."
    }
} else {
    Write-Host "Could not locate the built-in Guest account (SID ending in -501) on this system."
}
