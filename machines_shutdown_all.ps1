## Shutdown all machines

$computers = Get-Content -Path $PSScriptRoot\computers.txt
Stop-Computer -ComputerName $computers -Force