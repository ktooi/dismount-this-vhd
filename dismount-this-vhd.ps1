if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs; exit }
# FYI: https://correct-log.com/powershell_auto_admin/

Get-Volume | where DriveLetter -eq $(Split-Path -Qualifier $PSCommandPath).Replace(":","") | Get-Partition | Dismount-VHD
