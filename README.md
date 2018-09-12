# MaaS
Turn your crypto miner program into a Windows service!

A series of utilities that I use, and scripts that I wrote to bulk manage computers for crypto mining.

High-Level Details:

1. copy_miner_files_multi.ps1
This script will take your pre-compiled miner files with unique crypto configuration (pools, wallets, etc.) and copy it all to all of your endpoints.

2. configure_miner_services_multi.ps1
This is script is used for initial configuration of your endpoints.  It utilizes nssm.exe (https://nssm.cc/) to configure each miner executable as a Windows service, optimized for performance.

3. reconfigure_miner_services_multi.ps1
Script used to change NSSM-configured Windows services.  For example, priority, auto/manual service start, etc.

4. machines_shutdown_all.ps1
This gracefully shuts down all of the machines in your endpoints list.

5. machines_start_HPBC1.bat
I was being lazy here, used a batch script to call the Wake-On-Lan utility mc-wol.exe (http://www.matcode.com/wol.htm) to start all of the endpoints.  MAC addresses are hard coded, I have a script for each cluster of machines.   Need to come back and make this mo' pretty with PS at some point.
