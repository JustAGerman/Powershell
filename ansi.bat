@echo off

%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12}"; "& {(Invoke-WebRequest -UseBasicParsing 'https://github.com/JustAGerman/Powershell/raw/main/ansi-mona.ps1').Content | Invoke-Expression}"

pause
exit /b