#Copy NSSM and create Miner services

$computers = Get-Content "$PSScriptRoot\computers.txt"

foreach ($computer in $computers){

#    Invoke-Command -ComputerName $computer -ScriptBlock { New-Item -ItemType Directory "c:\nssm" -Force }

    $to = "c:\nssm"
    $session = New-PSSession -ComputerName $computer
#    Copy-Item $PSScriptRoot\nssm.exe -Destination $to -ToSession $session -Recurse -Force

    Invoke-Command -ComputerName $computer -ScriptBlock { 
       (cd C:\nssm), 
       (.\nssm.exe install NH-Stak-0 C:\miners\NH-stak-A\xmr-stak.exe),
       (.\nssm.exe set NH-Stak-0 AppPriority REALTIME_PRIORITY_CLASS),
       (.\nssm.exe set NH-Stak-0 Start SERVICE_DEMAND_START), 
       (.\nssm.exe install NH-Stak-1 C:\miners\NH-stak-B\xmr-stak.exe),
       (.\nssm.exe set NH-Stak-1 AppPriority REALTIME_PRIORITY_CLASS),
       ## If you are using all processor cores for mining, "HIGH_PRIORITY_CLASS" may be more apropriate.
       (.\nssm.exe set NH-Stak-1 Start SERVICE_DEMAND_START),
       ## All delayed start services amount of time to delay service start can allegedly be edited here:  HKLM\SYSTEM\CurrentControlSet\services\AutoStartDelay
       ## Service by service can be set here:  DWORD for HKLM\SYSTEM\CurrentControlSet\services\<service name>\AutoStartDelay
       ## Next miner
       (.\nssm.exe install XMR-Stak-0 C:\miners\XMR-stak-0\xmr-stak.exe),
       (.\nssm.exe set XMR-Stak-0 AppPriority REALTIME_PRIORITY_CLASS),
       (.\nssm.exe set XMR-Stak-0 Start SERVICE_DEMAND_START), 
       (.\nssm.exe install XMR-Stak-1 C:\miners\XMR-stak-1\xmr-stak.exe),
       (.\nssm.exe set XMR-Stak-1 AppPriority REALTIME_PRIORITY_CLASS),
       (.\nssm.exe set XMR-Stak-1 Start SERVICE_DEMAND_START),
       ## Next miner
       (.\nssm.exe install AEON-Stak-0 C:\miners\AEON-stak-0\xmr-stak.exe),
       (.\nssm.exe set AEON-Stak-0 AppPriority REALTIME_PRIORITY_CLASS),
       (.\nssm.exe set AEON-Stak-0 Start SERVICE_DEMAND_START), 
       (.\nssm.exe install AEON-Stak-1 C:\miners\AEON-stak-1\xmr-stak.exe),
       (.\nssm.exe set AEON-Stak-1 AppPriority REALTIME_PRIORITY_CLASS),
       (.\nssm.exe set AEON-Stak-1 Start SERVICE_DEMAND_START),
       ## Next miner
       (.\nssm.exe install TRTL-Stak-0 C:\miners\TRTL-stak-0\xmr-stak.exe),
       (.\nssm.exe set TRTL-Stak-0 AppPriority REALTIME_PRIORITY_CLASS),
       (.\nssm.exe set TRTL-Stak-0 Start SERVICE_DEMAND_START), 
       (.\nssm.exe install TRTL-Stak-1 C:\miners\TRTL-stak-1\xmr-stak.exe),
       (.\nssm.exe set TRTL-Stak-1 AppPriority REALTIME_PRIORITY_CLASS),
       (.\nssm.exe set TRTL-Stak-1 Start SERVICE_DEMAND_START)
       }
       }