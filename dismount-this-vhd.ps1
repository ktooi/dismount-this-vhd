if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs; exit }
Get-Volume | where DriveLetter -eq $(Split-Path -Qualifier $PSCommandPath).Replace(":","") | Get-Partition | Dismount-VHD
