$StopWatch = [system.diagnostics.stopwatch]::startNew()

Clear-DnsClientCache

[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
"cleared DNS cache in $Elapsed ms."