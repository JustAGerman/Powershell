Write-Progress "(1/2) Loading Data/frequent-domains.csv..."
$Table = Import-CSV "$PSScriptRoot/../Data/frequent-domains.csv"
$NumRows = $Table.Length

Write-Progress "(2/2) Resolving $NumRows domains..."
$StopWatch = [system.diagnostics.stopwatch]::startNew()
if ($IsLinux) {
	foreach($Row in $Table){$nop=dig $Row.Domain +short}
} else {
	foreach($Row in $Table){$nop=Resolve-DNSName $Row.Domain}
}
[float]$Elapsed = $StopWatch.Elapsed.TotalSeconds

$Average = [math]::round($NumRows / $Elapsed, 1)
"DNS resolves $Average domains per second"