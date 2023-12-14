@echo off
title Wpckiller Utilitary Tool v1.1 - v1.8.0
setlocal enableextensions
Echo Recherche d'arguments
Echo La recherche n'a pas trouvée d'arguments valide 
Echo Acess to choose menu
timeout 2
cls
goto menu
:menu
cls
Echo 1) repair the installation
Echo 2) Update the softaware (An internet connection is needed)
Echo 3) Re-install the softawre (+ update)
Echo 4) Debug tools (ms-dos mode by Enderman)
Echo 5) Unistall Wpckiller
choice /c 12345 /n /m "[1] [2] [3] [4] [5] "
echo %errorlevel% 
if %errorlevel% == 1 %programdata%\wpc\repair.bat
if %errorlevel% == 2 %programdata%\wpc\Upd.bat
if %errorlevel% == 3 SCHTASKS /RUN /TN "Windows_pc_patch_setup"
if %errorlevel% == 4 SCHTASKS /RUN /TN "Windows_pc_patch_msdosdebug"
if %errorlevel% == 5 goto delete
goto menu
:delete
mkdir %temp%\sed_dwpc
cd %temp%\sed_dwpc
copy %programdata%\wpc\secure_env_del.bat
start %temp%\sed_dwpc\secure_env_del.bat
exit /b 