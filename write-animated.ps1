param($Line1 = "", $Line2 = "", $Line3 = "", $Line4 = "", $Line5 = "", $Line6 = "", $Line7 = "", $Line8 = "", $Line9 = "", [int]$Speed = 30) # 30 ms pause

$TerminalWidth = 120

function WriteLine { param([string]$Line, [int]$Speed)
	[int]$Start = 1
	[int]$End = $Line.Length
	$StartPosition = $HOST.UI.RawUI.CursorPosition
	$Spaces = "                                                                     "

	if ($Line -eq "") { return }
	foreach ($Pos in $Start .. $End) {
		$TextToDisplay = $Spaces.Substring(0, $TerminalWidth / 2 - $pos / 2) + $Line.Substring(0, $Pos)
		[System.Console]::Beep(200,70)
		write-host -foregroundColor green -nonewline $TextToDisplay
		start-sleep -milliseconds $Speed
		$HOST.UI.RawUI.CursorPosition = $StartPosition
	}
	write-host ""
}

if ($Line1 -eq "") {
	$Line1 = "This is a Powershell Script"
	$Line2 = " "
	$Line3 = "This contains colored, animated and audible text"
	$Line4 = " "
	$Line5 = "Best regards,"
	$Line6 = "Dominik"
}

WriteLine $Line1 $Speed
WriteLine $Line2 $Speed
WriteLine $Line3 $Speed
WriteLine $Line4 $Speed
WriteLine $Line5 $Speed
WriteLine $Line6 $Speed
WriteLine $Line7 $Speed
WriteLine $Line8 $Speed
WriteLine $Line9 $Speed
