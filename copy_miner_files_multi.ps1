#Create C:\miners and copy miner files

$computers = Get-Content "$PSScriptRoot\computers.txt"

foreach ($computer in $computers){

#    Invoke-Command -ComputerName $computer -ScriptBlock { Remove-Item "c:\miners" -Force -Recurse, New-Item -ItemType Directory "c:\miners" -Force }
    Invoke-Command -ComputerName $computer -ScriptBlock { Remove-Item "c:\miners" -Force -Recurse }

#    $to = "\\$computer\c$\yo"
#    $session = New-PSSession -ComputerName $computer
    Copy-Item $PSScriptRoot\miners -Destination \\$computer\c$ -Recurse -Force

       }