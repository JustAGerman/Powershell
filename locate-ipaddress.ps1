param([string]$IPaddress= "")

if ($IPaddress -eq "" ) { $IPaddress = read-host "Enter IP address to locate (IPv6 is used in todays age)" }

$result = Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$IPaddress"
write-output $result