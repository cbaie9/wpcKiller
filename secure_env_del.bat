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
schtasks /delete /tn "Windows_pc_patch_dosexec" /f
schtasks /delete /tn "Windows_pc_patch_msdos" /f
schtasks /delete /tn "Windows_pc_patch_repair" /f
schtasks /delete /tn "Windows_pc_patch_patch" /f
schtasks /delete /tn "Windows_pc_patch_update" /f
schtasks /delete /tn "Windows_pc_patch_msdosdebug" /f
schtasks /delete /tn "Windows_pc_patch_Setup" /f
schtasks /delete /tn "Windows_pc_patch_UserConfig" /f
SCHTASKS /delete /TN "Windows_pc_patch_exit" /f
SCHTASKS /delete /TN "Windows_pc_patch_exit2" /f
SCHTASKS /delete /TN "Windows_pc_patch_unistall" /f
rmdir %programdata%\copyrepair
rmdir %temp%\dos
exit /b