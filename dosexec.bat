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
cd %windir%\system32
del Wpc.dll /Q
del WpcMon.exe.mui /Q
del WpcMon.exe /Q
del WpcApi.dll /Q
del WpcWebfilter.dll /Q
del WpcDesktopMonSvc.dll /Q
del Wpctok.exe /Q
del WpcRefreshTask.dll /Q
del Wpc.dll.mui /Q
del WpcProxyStubs.dll /Q
del WpcRefresh.dll.mui /Q
del Wpcatltoast.png /Q
del Wpcmon.png /Q
cd fr-FR
del WpcMon.exe.mui /Q
del Wpc.Dll.mui /q
del WpcRefreshTask.dll /Q
cd %systemroot%\system32\migration
del WpcMigration.uplevel.dll /q
rmdir %systemroot%\WinSxS\amd64_dual_wpcip.inf_31bf3856ad364e35_10.0.22000.318_none_b9933c4a406b3dc8
del %systemroot%\WinSxS\amd64_microsoft-windows-p..trols-wpcproxystubs_31bf3856ad364e35_10.0.22000.1_none_2c0ccfb66f88abfb\WpcProxyStubs.dll /q
del %systemroot%\WinSxS\amd64_wpcip.inf.resources_31bf3856ad364e35_10.0.22000.1_fr-fr_54d5b3cdc7780631\wpcip.inf_loc /q
rmdir %systemroot%\WinSxS\wow64_microsoft-windows-p..lcontrols-webfilter_31bf3856ad364e35_10.0.22000.318_none_3103f122dcfac4fc
Del C:\Windows\SysWOW64\WpcWebFilter.dll /q
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
