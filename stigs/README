# Windows 11 STIG Remediation Scripts

PowerShell remediation scripts for DISA STIG findings on a Windows 11 homelab system, written and validated against the **Microsoft Windows 11 STIG v2r8**. Each script targets a single STIG-ID, is idempotent (safe to re-run), and follows a consistent template so findings can be tracked, tested, and handed off individually.

Fixes are validated against Tenable Nessus compliance scans after each script runs.

## Scripts

| STIG-ID | Finding | Category | Remediation Method |
|---|---|---|---|
| [WN11-AC-000010](./STIG-ID-WN11-AC-000010.ps1) | Account lockout threshold must be 3 or fewer invalid logon attempts | Account Policy | `net accounts` |
| [WN11-AC-000020](./STIG-ID-WN11-AC-000020.ps1) | Password history must remember 24 passwords | Account Policy | `net accounts` |
| [WN11-AU-000500](./STIG-ID-WN11-AU-000500.ps1) | Application event log max size must be ≥ 32768 KB | Audit Policy | Registry |
| [WN11-AU-000570](./STIG-ID-WN11-AU-000570.ps1) | Audit Detailed File Share failures | Audit Policy | `auditpol` |
| [WN11-AU-000589](./STIG-ID-WN11-AU-000589.ps1) | Audit Registry failures | Audit Policy | `auditpol` |
| [WN11-CC-000039](./STIG-ID-WN11-CC-000039.ps1) | Remove "Run as different user" from context menus | Computer Configuration | Registry |
| [WN11-CC-000310](./STIG-ID-WN11-CC-000310.ps1) | Prevent users from changing installation options | Computer Configuration | Registry |
| [WN11-CC-000315](./STIG-ID-WN11-CC-000315.ps1) | Disable "Always install with elevated privileges" | Computer Configuration | Registry |
| [WN11-CC-000370](./STIG-ID-WN11-CC-000370.ps1) | Disable convenience PIN sign-in | Computer Configuration | Registry |
| [WN11-CC-000391](./STIG-ID-WN11-CC-000391.ps1) | Disable Internet Explorer 11 as a standalone browser | Computer Configuration | Registry |
| [WN11-SO-000025](./STIG-ID-WN11-SO-000025.ps1) | Rename the built-in Guest account | Security Options | `Rename-LocalUser` |
| [WN11-UR-000160](./STIG-ID-WN11-UR-000160.ps1) | Restrict "Restore files and directories" right to Administrators | User Rights Assignment | `secedit` |

Not every STIG finding is a plain registry edit — several controls live in the local security policy database or advanced audit policy store, so the scripts use `secedit`, `auditpol`, or `net accounts` where that's the correct remediation surface rather than forcing everything through the registry.

## Usage

Each script is self-contained and requires an elevated (Administrator) PowerShell session:

```powershell
# Run directly
.\STIG-ID-<ID>.ps1

# Or bypass execution policy for a one-off run
powershell.exe -ExecutionPolicy Bypass -File .\STIG-ID-<ID>.ps1
```

Every script includes a comment-based header documenting the STIG-ID, any associated CVEs or scanner Plugin IDs, and a `TESTED ON` block for recording the system, PowerShell version, and date validated.

## Requirements

- Windows 11
- PowerShell 5.1 or later, run as Administrator
- Local Security Policy / registry write access (domain-joined systems may need a corresponding GPO if a domain policy would overwrite the local setting)

## Disclaimer

These scripts were written and tested against a personal homelab system for portfolio and learning purposes. They are not an official or certified STIG compliance tool. Review each script and test in a non-production environment before applying it anywhere else, and confirm results against your own compliance scan (SCAP, ACAS, Nessus, etc.) rather than relying on script output alone.

## Author

**Philip Zangara**
[LinkedIn](https://www.linkedin.com/in/philip-zangara/) · [GitHub](https://github.com/philipzangara) · [philipzangara.com](https://philipzangara.com)