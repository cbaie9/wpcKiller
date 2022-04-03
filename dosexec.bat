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
:cp_win
cd %windir%\system32
del WpcMigration.uplevel.dll
del Wpc.dll
del WpcMon.exe
del WpcApi.dll
del WpcWebfilter.dll
del WpcDesktopMonSvc.dll
del Wpctok.exe
del WpcRefreshTask.dll
del Wpc.dll.mui
del WpcMon.exe.mui
del WpcProxyStubs.dll
del WpcRefresh.dll.mui
del Wpcatltoast.png
del Wpcmon.png
echo done ;) reboot
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
cmd.exe
shutdown -r -t 0
ping localhost -n 3 > nul
echo Failed. Attempt #2
shutdown -r -t 0
ping localhost -n 3 > nul
echo Failed. Attempt #3
shutdown -r -t 0
:cp_or
cd C:\Program Files (x86)\
rmdir "Contrôle Parental Orange" /S /Q
Cd %programdata%
rmdir "Contrôle Parental Orange" /S /Q
cd %systemROOT%\System32\drivers
del cpwnetfilter.sys
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
