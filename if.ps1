if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # Relaunch the script with administrative privileges
    Start-Process powershell.exe -ArgumentList " -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}
# Define the URL to the hosts file
$githubRawUrl = "https://raw.githubusercontent.com/JustAGerman/Powershell/main/hosts"

# Define the destination path (system's hosts file location)
$destinationPath = "C:\Windows\System32\drivers\etc\hosts"

# Download the raw hosts file
Invoke-WebRequest -Uri $githubRawUrl -OutFile $destinationPath -UseBasicParsing

# flush the DNS cache to apply changes immediately
ipconfig /flushdns
