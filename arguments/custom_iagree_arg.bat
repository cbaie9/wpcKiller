@echo off
echo Here you can add arguments who are getting executed
echo To activate the arguments just delete the "_iagree_" part on the name of the file and lunch "Reload.bat"
echo Arguments must be written in the specific area
pause
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Arguments here
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
title Rebooting 
powershell sleep 1
echo rebooting..
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Running as NT AUTHORITY, no elevation needed
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo Starting the file... 
ping localhost -n 2 > nul
echo Exiting the install mode
#  _______________________________________
# / Arguments here                        \ 
# \_______________________________________/
echo.
echo Tweaking the registry...
reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "" /f
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 0 /f > nul
schtasks /change /disable /tn Windows_pc_patch_dosexec
echo.
echo Done, rebooting. (3 attempts)
echo Attempt #1
shutdown -r -t 0
ping localhost -n 3 > nul
echo Failed. Attempt #2
shutdown -r -t 0
ping localhost -n 3 > nul
echo Failed. Attempt #3
shutdown -r -t 0
echo Failed. If Windows hasn't rebooted yet, try resetting the machine.
title failed To reboot
timeout 10
echo Trying Clasic exit system
SCHTASKS /RUN /TN "Windows_pc_patch_exit"
You are at & dir
cmd
