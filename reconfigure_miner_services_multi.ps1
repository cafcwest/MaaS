#Copy NSSM and create Miner services

$computers = Get-Content "$PSScriptRoot\computers.txt"

foreach ($computer in $computers){

 #   Invoke-Command -ComputerName $computer -ScriptBlock { New-Item -ItemType Directory "c:\nssm" -Force }

    $to = "c:\nssm"
 #   $session = New-PSSession -ComputerName $computer
 #   Copy-Item $PSScriptRoot\nssm.exe -Destination $to -ToSession $session -Recurse -Force

    Invoke-Command -ComputerName $computer -ScriptBlock { 
       (cd C:\nssm), 
       (.\nssm.exe set XMR-Stak-0 Start SERVICE_DELAYED_AUTO_START), 
       (.\nssm.exe set XMR-Stak-1 Start SERVICE_DELAYED_AUTO_START)
       ## All delayed start services amount of time to delay service start can allegedly be edited here:  HKLM\SYSTEM\CurrentControlSet\services\AutoStartDelay
       ## Service by service can be set here:  DWORD for HKLM\SYSTEM\CurrentControlSet\services\<service name>\AutoStartDelay
       }
       }