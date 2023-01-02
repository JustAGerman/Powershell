param([string]$Text = "", [string]$ImageSize = "")

if ($Text -eq "") { $Text = read-host "Enter text or URL" }
if ($ImageSize -eq "") { $ImageSize = read-host "Enter image size (e.g. 500x500)" }

$ECC = "M" # can be L, M, Q, H
$QuietZone = 1
$ForegroundColor = "000000"
$BackgroundColor = "ffffff"
$FileFormat = "png"
	if ($IsLinux) {
			$PathToPics = Resolve-Path "$HOME/Pictures"
	} else {
			$PathToPics = [Environment]::GetFolderPath('MyPictures')
	}
	if (-not(Test-Path "$PathToPics" -pathType container)) {
			throw "Pictures folder at 📂$Path doesn't exist (yet)"
	}
$NewFile = "$PathToPics/QR_code.png"

$WebClient = new-object System.Net.WebClient
$WebClient.DownloadFile(("http://api.qrserver.com/v1/create-qr-code/?data=" + $Text + "&ecc=" + $ECC +`
	"&size=" + $ImageSize + "&qzone=" + $QuietZone + `
	"&color=" + $ForegroundColor + "&bgcolor=" + $BackgroundColor.Text + `
	"&format=" + $FileFormat), $NewFile)

"saved new QR code image file to: $NewFile"