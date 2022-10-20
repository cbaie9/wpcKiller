@echo off
title Wpckiller Deleting Tool
cls
:menu
echo Do you want to delete Wpckiller from this computer (all user)
powershell sleep 2
choice /c yn /m "[Y] [N]"
if %errorlevel% == 1 goto dl2
if %errorlevel% == 2 exit /b
pause 
goto menu
:dl2
Echo Deleting...
rmdir %programdata%\wpc
schtasks /delete /tn "Windows_pc_patch_dosexec"
schtasks /delete /tn "Windows_pc_patch_msdos"
schtasks /delete /tn "Windows_pc_patch_repair"
schtasks /delete /tn "Windows_pc_patch_patch"
schtasks /delete /tn "Windows_pc_patch_Setup"
schtasks /delete /tn "Windows_pc_patch_UserConfig"
rmdir %programdata%\copyrepair
rmdir %temp%\dos
start cmd /k "rmdir %temp%\sed_dwpc"
exit /b