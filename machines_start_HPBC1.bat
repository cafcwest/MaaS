@echo off
title Start up HPBC1
%~dp0\mc-wol.exe E8:39:35:18:48:CA
timeout 15
%~dp0\mc-wol.exe 44:1E:A1:70:D0:1C
timeout 15
%~dp0\mc-wol.exe 44:1E:A1:70:D6:EE
timeout 15
%~dp0\mc-wol.exe E8:39:35:19:1A:BA
timeout 15
%~dp0\mc-wol.exe 44:1E:A1:70:CD:82
timeout 15
%~dp0\mc-wol.exe E8:39:35:18:41:B0
timeout 15
%~dp0\mc-wol.exe 44:1E:A1:72:99:88
timeout 15
%~dp0\mc-wol.exe 44:1E:A1:76:67:40