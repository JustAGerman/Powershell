$url = "https://github.com/JustAGerman/Powershell/raw/main/ansi-art.ans"
$output = "$env:USERPROFILE\ansi-art.ans"

Invoke-WebRequest -Uri $url -OutFile $output

$currentLocation = Get-Location
$file = Get-Content "$currentLocation\ansi-art.ans"

Get-Content .\ansi-art.ans

Write-Host -NoNewLine 'Press any key to exit';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');