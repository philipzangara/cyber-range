<#
.SYNOPSIS
    This PowerShell script ensures the 'Restore files and directories' user right (SeRestorePrivilege) is assigned only to the Administrators group on Windows 11.

.NOTES
    Author          : Philip Zangara
    LinkedIn        : https://www.linkedin.com/in/philip-zangara/
    GitHub          : https://github.com/philipzangara
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-UR-000160

.TESTED ON
    Date(s) Tested  : 2026-09-08
    Tested By       : Philip Zangara
    Systems Tested  : Microsoft Windows 11 Pro 10.0.26200
    PowerShell Ver. : 5.1

.USAGE
    PS C:\> .\STIG-ID-WN11-UR-000160.ps1
#>

# User Rights Assignment is stored in the Local Security Policy database, not the registry,
# so this is remediated via a temporary security template applied with secedit.exe.

$seceditDb   = "$env:windir\security\local.sdb"
$tempInf     = Join-Path $env:TEMP "WN11-UR-000160.inf"
$tempLog     = Join-Path $env:TEMP "WN11-UR-000160.log"

# Administrators group SID (S-1-5-32-544) - the only account/group that should hold this right
$inf = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeRestorePrivilege = *S-1-5-32-544
"@

Set-Content -Path $tempInf -Value $inf -Encoding Unicode

# Apply the security template
secedit /configure /db $seceditDb /cfg $tempInf /areas USER_RIGHTS /log $tempLog

# Clean up temporary files
Remove-Item -Path $tempInf -Force -ErrorAction SilentlyContinue

# Output success message
Write-Host "'Restore files and directories' (SeRestorePrivilege) user right restricted to Administrators (S-1-5-32-544)."
