# Check if running with administrator privileges
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Script requires administrator privileges. Restarting with elevated permissions..."
    Start-Process powershell.exe -ArgumentList " -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

try {
    # Define the URL to the hosts file
    $githubRawUrl = "https://raw.githubusercontent.com/JustAGerman/Powershell/main/hosts"

    # Define the destination path (system's hosts file location)
    $destinationPath = "C:\Windows\System32\drivers\etc\hosts"

    # Download the raw hosts file
    Write-Host "Downloading hosts file from $githubRawUrl..."
    Invoke-WebRequest -Uri $githubRawUrl -OutFile $destinationPath -UseBasicParsing
    Write-Host "Hosts file downloaded successfully."

    # flush the DNS cache to apply changes immediately
    Write-Host "Flushing DNS cache..."
    ipconfig /flushdns
    Write-Host "DNS cache flushed. Script execution completed."
}
catch {
    Write-Host "Error: $_"
}
