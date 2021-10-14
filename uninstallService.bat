:: Cresco Windows Service Uninstallation
@echo off
rem Uninstall service

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

if %OS%==32BIT set VERSION=x32
if %OS%==64BIT set VERSION=x64

%VERSION%\prunsrv //DS/CrescoAgent
