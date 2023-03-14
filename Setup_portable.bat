@echo off
set ver=1_7_0
set uzpath=%cd%
setlocal enableextensions
Mkdir %programdata%\Copyrepair\%ver%
Mkdir %programdata%\wpc
Cd %programdata%\copyrepair\%ver%
copy %uzpath%
Cd %programdata%\Wpc	
copy %uzpath%	
reg add HKEY_CURRENT_USER\Software\Wpckiller /v temp32 /T REG_BINARY /d 1 /f
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v Wpc_portable /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v Wpc_arg /T REG_DWORD /d -1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CurrentLanguage /T REG_BINARY /d 0 /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "(Default)" /t REG_SZ /d "URL:Wpckiller Protocol" /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "URL Protocol" /t REG_SZ /F
reg add HKEY_CLASSES_ROOT\Wpckiller\shell\open\command /v "(default)" /d "C:/Programdata/Wpc/Utilitary.bat"
if exist "%programdata%\wpc\arguments\customarg.bat" then reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\customarg.bat" /f else reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\dosexec.bat" /f
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 2 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f > nul 
SCHTASKS /CREATE /SC onStart /TN "Windows_pc_patch_dosexec" /TR "%programdata%\Wpc\dosexec.bat" /ru system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_msdos" /TR "%programdata%\Wpc\msdos.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_repair" /TR "%programdata%\Wpc\repair.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_patch" /TR "%programdata%\Wpc\patch.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_update" /TR "%programdata%\Wpc\udp.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_msdosdebug" /TR "%programdata%\Wpc\msDebug.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_Setup" /TR "%programdata%\Wpc\setup_portable.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_UserConfig" /TR "%programdata%\Wpc\Utilitary.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_exit" /TR "%programdata%\Wpc\exit.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_exit2" /TR "%programdata%\Wpc\win.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_unistall" /TR "%temp%\sed_dwpc\secure_env_del.bat" /RU system /ec system
cls
echo EN : The Software is pre-installed This will be finished at the restart of the computer
echo FR : Le Programme à été pré-installée Le programme s'installera completement au redémarrage de l'ordinateur
pause
exit /b