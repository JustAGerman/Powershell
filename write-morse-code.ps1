param([string]$text = "", [int]$speed = 100)

function gap { param([int]$Length)
	for ([int]$i = 1; $i -lt $Length; $i++) {
		write-host " " -nonewline
	}
	start-sleep -milliseconds ($Length * $speed)
}

function dot {
	write-host "." -nonewline
	start-sleep -milliseconds $speed
}

function dash {
	write-host "_" -nonewline
	start-sleep -milliseconds (3 * $speed)
}

function Char2MorseCode { param([string]$Char)
	switch($Char) {
	'A' { dot; gap 1; dash; gap 3 }
	'B' { dash; gap 1; dot; gap 1; dot; gap 1; dot; gap 3 }
	'C' { dash; gap 1; dot; gap 1; dash; gap 1; dot; gap 3 }
	'D' { dash; gap 1; dot; gap 1; dot; gap 3 }
	'E' { dot; gap 3 }
	'F' { dot; gap 1; dot; gap 1; dash; gap 1; dot; gap 3 }
	'G' { dash; gap 1; dash; gap 1; dot; gap 3 }
	'H' { dot; gap 1; dot; gap 1; dot; gap 1; dot; gap 3 }
	'I' { dot; gap 1; dot; gap 3 }
	'J' { dot; gap 1; dash; gap 1; dash; gap 1; dash; gap 3 }
	'K' { dash; gap 1; dot; gap 1; dash; gap 3 }
	'L' { dot; gap 1; dash; gap 1; dot; gap 1; dot; gap 3 }
	'M' { dash; gap 1; dash; gap 3 }
	'N' { dash; gap 1; dot; gap 3 }
	'O' { dash; gap 1; dash; gap 1; dash; gap 3 }
	'P' { dot; gap 1; dash; gap 1; dash; gap 1; dot; gap 3 }
	'Q' { dash; gap 1; dash; gap 1; dot; gap 1; dash; gap 3 }
	'R' { dot; gap 1; dash; gap 1; dot; gap 3 }
	'S' { dot; gap 1; dot; gap 1; dot; gap 3 }
	'T' { dash; gap 3 }
	'U' { dot; gap 1; dot; gap 1; dash; gap 3 }
	'V' { dot; gap 1; dot; gap 1; dot; gap 1; dash; gap 3 }
	'W' { dot; gap 1; dash; gap 1; dash; gap 3 }
	'X' { dash; gap 1; dot; gap 1; dot; gap 1; dash; gap 3 }
	'Y' { dash; gap 1; dot; gap 1; dash; gap 1; dash; gap 3 }
	'Z' { dash; gap 1; dash; gap 1; dot; gap 1; dot; gap 3 }
	'1' { dot; gap 1; dash; gap 1; dash; gap 1; dash; gap 1; dash; gap 3 }
	'2' { dot; gap 1; dot; gap 1; dash; gap 1; dash; gap 1; dash; gap 3 }
	'3' { dot; gap 1; dot; gap 1; dot; gap 1; dash; gap 1; dash; gap 3 }
	'4' { dot; gap 1; dot; gap 1; dot; gap 1; dot; gap 1; dash; gap 3 }
	'5' { dot; gap 1; dot; gap 1; dot; gap 1; dot; gap 1; dot; gap 3 }
	'6' { dash; gap 1; dot; gap 1; dot; gap 1; dot; gap 1; dot; gap 3 }
	'7' { dash; gap 1; dash; gap 1; dot; gap 1; dot; gap 1; dot; gap 3 }
	'8' { dash; gap 1; dash; gap 1; dash; gap 1; dot; gap 1; dot; gap 3 }
	'9' { dash; gap 1; dash; gap 1; dash; gap 1; dash; gap 1; dot; gap 3 }
	'0' { dash; gap 1; dash; gap 1; dash; gap 1; dash; gap 1; dash; gap 3 }
	default { gap 7 }
	}
}
if ($text -eq "" ) { [string]$text = read-host "Enter text to Translate" }

[char[]]$ArrayOfChars = $text.ToUpper()
foreach($Char in $ArrayOfChars) {
	Char2MorseCode $Char 
}
write-host ""
write-host ""