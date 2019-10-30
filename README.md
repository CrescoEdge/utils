# Cresco Service Utilities

Scripts and tools for agent service install and management

## Windows 32/64 bit

### Install Instructions

1. Create a home directory (c:\cresco) for you Cresco Agent application, data, and install utilities. 
2. Download or clone the [Cresco Utilities](https://github.com/CrescoEdge/utils) to your home directory (c:\cresco\utils).
3. Download the latest [Cresco Agent release](https://github.com/CrescoEdge/agent/releases) to the root of your home directory.
4. Download a Java 1.8 or 11 JRE/JDK that provides a JVM.DLL, if one is not already installed.  It is recommended to download the [AdoptOpenJDK8 Hotspot](https://adoptopenjdk.net/) ZIP and uncompress it in your home folder (c:\cresco\jre).
5. While in the Cresco utilities directory (c:\cresco\util) use the installservice.bat script to install your service.
6. While in the Cresco utilities directory (c:\cresco\util) use the servicemanager.bat to start/stop/edit your service.  The service (CrescoAgent) can also be controlled from Windows Services. 

### installservice.bat
This batch file is used to install the Cresco Agent service on 32 bit and 64 bit versions of Windows making use of the Apache Commons Daemon https://commons.apache.org/proper/commons-daemon/ Procrun service.  The script takes two arguements, the location of the appropirate JVM DLL for your system (Java 1.8/11) and the Cresco home directory containing the agent jar.

Usage: installService JVM_DLL_location Cresco_Home
Example: installService c:\cresco\jre\bin\client\jvm.dll c:\cresco

### uninstallService.bat
This batch file removes the Cresco Agent service and takes no arguements.

Usage: uninstallService

### servicemanager.bat
This batch file runs the Apache Commons Daemon Manager (Prunmgr) and must be run in the directory containing the Prunmgr.exe
