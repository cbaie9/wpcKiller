@echo off
title Wpckiller Deleting Tool ( français )
cls
:menu
echo Voulez-vous supprimer Wpckiller de votre ordinateur ?
powershell sleep 2
choice /c yn /m "[Y] [N]"
if %errorlevel% == 1 goto dl2
if %errorlevel% == 2 exit /b
pause 
goto menu
:dl2
Echo Supression en cours
rmdir %programdata%\wpc
schtasks /delete /tn "Windows_pc_patch_dosexec"
schtasks /delete /tn "Windows_pc_patch_msdos"
schtasks /delete /tn "Windows_pc_patch_repair"
schtasks /delete /tn "Windows_pc_patch_patch"
schtasks /delete /tn "Windows_pc_patch_Setup"
schtasks /delete /tn "Windows_pc_patch_UserConfig"
SCHTASKS /delete /TN "Windows_pc_patch_exit"
SCHTASKS /delete /TN "Windows_pc_patch_exit2"
SCHTASKS /delete /TN "Windows_pc_patch_unistall"
rmdir %programdata%\copyrepair
rmdir %temp%\dos
start cmd /k "rmdir %temp%\sed_dwpc"
exit /b