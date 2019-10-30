# Cresco Service Utilities

Scripts and tools for agent service install and management

## installservice.bat
This batch file is used to install the Cresco Agent service on 32 bit and 64 bit versions of Windows making use of the Apache Commons Daemon https://commons.apache.org/proper/commons-daemon/ Procrun service.  The script takes two arguements, the location of the appropirate JVM DLL for your system (Java 1.8/11) and the Cresco home directory containing the agent jar.

Usage: installService JVM_DLL_location Cresco_Home
Example: installService c:\cresco\jre\bin\client\jvm.dll c:\cresco

## uninstallService.bat
This batch file removes the Cresco Agent service and takes no arguements.

Usage: uninstallService

## servicemanager.bat
This batch file runs the Apache Commons Daemon Manager (Prunmgr) and must be run in the directory containing the Prunmgr.exe
