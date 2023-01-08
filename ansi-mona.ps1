$url = "https://github.com/JustAGerman/Powershell/raw/main/ansi-art.ans"
$output = "$env:USERPROFILE\ansi-art.ans"

Invoke-WebRequest -Uri $url -OutFile $output

Get-Content "$env:USERPROFILE\ansi-art.ans"

Write-Host -NoNewLine 'Press any key to exit';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
