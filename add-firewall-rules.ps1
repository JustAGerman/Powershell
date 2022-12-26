﻿param([string]$PathToExecutables = "")

$command = '
$output = ''Firewall rules for path '' + $args[0]
write-output $output
for($i = 1; $i -lt $args.count; $i++){
	$path = $args[0]
	$path += ''\''
	$path += $args[$i]

	$null = $args[$i] -match ''[^\\]*\.exe$''
	$name = $matches[0]
    $output = ''Adding firewall rule for '' + $name
	write-output $output
	$null = New-NetFirewallRule -DisplayName $name -Direction Inbound -Program $path -Profile Domain, Private -Action Allow
}
write-host -foregroundColor green -noNewline ''Done - press any key to continue...'';
[void]$Host.UI.RawUI.ReadKey(''NoEcho,IncludeKeyDown'');
'
	if ($PathToExecutables -eq "" ) {
		$PathToExecutables = read-host "Enter path to executables"
	}

	$PathToExecutables = Convert-Path -Path $PathToExecutables

	$Apps = Get-ChildItem "$PathToExecutables\*.exe" -Name

	if($Apps.count -eq 0){
		write-warning "No executables found. No Firewall rules have been created."
		Write-Host 'Press any key to continue...';
		[void]$Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
	}

	$arg = "PathToExecutables $Apps"
	Start-Process powershell -Verb runAs -ArgumentList "-command & {$command}  $arg"
