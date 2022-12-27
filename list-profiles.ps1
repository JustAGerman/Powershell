function ListProfile { param([int]$Level, [string]$Profile, [string]$Location)
	if (test-path "$Location") { $Existent = "yes" } else { $Existent = "no" }
	New-Object PSObject -Property @{ 'Level'="$Level"; 'Profile'="$Profile"; 'Location'="$Location"; 'Existent'="$Existent"	}
}
function ListProfiles { 
	ListProfile 1 "AllUsersAllHosts"       $PROFILE.AllUsersAllHosts
	ListProfile 2 "AllUsersCurrentHost"    $PROFILE.AllUsersCurrentHost
	ListProfile 3 "CurrentUserAllHosts"    $PROFILE.CurrentUserAllHosts
	ListProfile 4 "CurrentUserCurrentHost" $PROFILE.CurrentUserCurrentHost
}