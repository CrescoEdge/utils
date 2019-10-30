:: Cresco Windows Service Installation
@echo off
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

if %OS%==32BIT set VERSION=x32
if %OS%==64BIT set VERSION=x64

rem Remove surrounding quotes from the first parameter
set str=%~1
rem Check JVM DLL location parameter
if "%str%" == "" goto missingJVM
set JVM_DLL=%str%
rem Remove surrounding quotes from the second parameter
set str=%~2
rem Check Cresco Home location parameter
if "%str%" == "" goto missingCrescoHome
set CRESCO_HOME=%str%

rem Install service
%VERSION%\prunsrv.exe //IS/CrescoAgent --DisplayName="Cresco Agent" ^
--Description="Cresco Agent Service" ^
--StartClass=io.cresco.main.AgentEngine --StopClass=io.cresco.main.AgentEngineShutdown ^
--Classpath="%CRESCO_HOME%\*;%CRESCO_HOME%\plugins\*" ^
--JvmOptions=-Xms256m;-Xmx768m ^
--StartMode=jvm --StartPath="%CRESCO_HOME%" --StopMode=jvm --StopPath="%CRESCO_HOME%" --Jvm="%JVM_DLL%" --LogPath="%CRESCO_HOME%\windows-service-log" --Startup=auto


EXIT /B

:missingJVM
echo Insert the JVM DLL location
goto printUsage

:missingCrescoHome
echo Insert the Cresco Home
goto printUsage

:printUsage
echo usage:
echo     installService JVM_DLL_location Cresco_Home
echo     Example: installService c:\cresco\jre\bin\client\jvm.dll c:\cresco
EXIT /B