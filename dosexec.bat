@echo off 
echo This is a default dosexec file, you can add commands here to run on the next recovery startup. 
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f 
net start  
start explorer  
ping localhost -n 3  
@echo off
echo starting...
powershell sleep 1 
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
echo done ;)
powershell sleep 1
@echo off
echo MS-DOS Mode Implementation for Windows 10 by Endermanch (Elevation exploit by Matt)
echo.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Running as NT AUTHORITY, no elevation needed
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.
echo Starting the file... 
ping localhost -n 2 > nul
echo Exiting MS-DOS (recovery) mode...
echo.
echo Tweaking the registry...
reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "" /f
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 0 /f > nul
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


