function GetTempDir {
    if ("$env:TEMP" -ne "") { return "$env:TEMP" }
    if ("$env:TMP" -ne "")  { return "$env:TMP" }
    if ($IsLinux) { return "/tmp" }
    return "C:\Temp"
}

$Path = GetTempDir
Set-Location "$Path"
"$Path"
start-process explorer.exe "$Path"
