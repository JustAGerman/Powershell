param([string]$Text = "Here is some Text that will come from the side, its supposed to  be fancy but I hate it personally", [int]$Speed = 60) # 60 ms pause

function StartMarquee { param([string]$Line)
	"╔══════════════════════════════════════════════════════════════════════════════════╗"
	"║                                                                                  ║"
	"╚══════════════════════════════════════════════════════════════════════════════════╝"
	$LinePos = $HOST.UI.RawUI.CursorPosition
	$LinePos.X = 2
	$LinePos.Y -= 2
	foreach($Pos in 1 .. $($Line.Length - 80)) {
		$HOST.UI.RawUI.CursorPosition = $LinePos
		Write-Host -noNewLine "$($Line.Substring($Pos,80))"
		Start-Sleep -milliseconds $Speed
	}
	" "
	" "
	" "
}

StartMarquee "                                                                                    +++ $Text +++ $Text +++ $Text +++ $Text +++ $Text +++ $Text +++ $Text +++ $Text +++ $Text +++ $Text +++ $Text +++ $Text +++                                                                                         "