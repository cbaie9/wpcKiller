@echo off 
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f 
net start  
start explorer  
ping localhost -n 3  
@echo off
echo starting...
powershell stop-service wpcmonsvc
powershell sleep 1 
If exist C:\Program Files (x86)\Contrôle Parental Orange goto cp_or
echo Check driver 1 : status ok
:cp_win
echo update 
title Updating system
cd %windir%\system32
del WpcMigration.uplevel.dll /q
del Wpc.dll /q
del WpcMon.exe /q
del WpcApi.dll /q
del WpcWebfilter.dll /q 
del WpcDesktopMonSvc.dll /q 
del Wpctok.exe /q 
del WpcRefreshTask.dll /q
del Wpc.dll.mui /q 
del WpcMon.exe.mui /q 
del WpcProxyStubs.dll /q 
del WpcRefresh.dll.mui/q
del Wpcatltoast.png /q 
del Wpcmon.png /q
echo Driver n°2 updated at v1.5.0
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
echo.
echo Tweaking the registry...
reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "" /f
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f > nul
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
echo Try to type exit or shutdown -r
You are at & dir
@echo on
cmd
@echo off
echo
shutdown -r -t 0
ping localhost -n 3 > nul
echo Failed. Attempt #2
shutdown -r -t 0
ping localhost -n 3 > nul
echo Failed. Attempt #3
shutdown -r -t 0
cmd
exit /B
:cp_or
cd C:\Program Files (x86)\
rmdir "Contrôle Parental Orange" /S /Q
Cd %programdata%
rmdir "Contrôle Parental Orange" /S /Q
cd %systemROOT%\System32\drivers
del cpwnetfilter.sys /q
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run\[@]Contrôle Parental Orange v7
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run\[@]CPDisplayContent
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]DisplayName
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]Publisher
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]VersionMajor
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]VersionMinor
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]InstallTag
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]DisplayIcon
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]InstallLocation
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]UninstallString
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]DisplayVersion
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]HelpLink
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]EstimatedSize
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]PasswordType 
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ocsvc\[@]InstallationProgress
del %temp% /s /q
goto cp_win
 # made by cb9,cbaie9 2020-2022
