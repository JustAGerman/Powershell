$url = "https://github.com/JustAGerman/Powershell/raw/main/pig.ans"
$output = "$env:USERPROFILE\pig.ans"

Invoke-WebRequest -Uri $url -OutFile $output

$url = "https://github.com/JustAGerman/Powershell/raw/main/2.mp3"
$output = "$env:USERPROFILE\2.mp3"

Invoke-WebRequest -Uri $url -OutFile $output

& 'C:\Program Files\VideoLAN\VLC\vlc.exe' --qt-start-minimized --loop --qt-notification=0 "$env:USERPROFILE\2.mp3"

Get-Content "$env:USERPROFILE\pig.ans"

Write-Host -NoNewLine 'I told you I would do it';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');