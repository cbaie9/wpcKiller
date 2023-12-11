@echo off
setlocal enableextensions
set ver=1.8.0
set uzpath=%temp%\Dos
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
echo 1) english
echo 2) français
choice /c 12 /n /m ""
echo %errorlevel% 
if %errorlevel% == 1 goto en
if %errorlevel% == 2 goto fr
:fr
echo  Vous essayer d'installer une beta 
echo -> appuiyer sur une touche pour commencer
echo version %ver% beta
cls
echo installing powershell 
winget search Microsoft.PowerShell
Mkdir %programdata%\Copyrepair\%ver%
Mkdir %uzpath%
Mkdir %programdata%\Wpc
cd %uzpath%
cls
echo Téléchargement des fichier requis
if not exist files.zip powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
Echo de-zippage des fichier
if not exist %uzpath%\files powershell -command "Expand-Archive -LiteralPath %uzpath%\files.zip"
echo Copie de fichier..
Cd %programdata%\copyrepair\%ver%
copy %uzpath%\files\wpcKiller-main
Cd %programdata%\Wpc	
copy %uzpath%\files\Wpckiller-main	
echo Mise à jour du registre system / mise en place de Sauvegarde
reg add HKEY_CURRENT_USER\Software\Wpckiller /v temp32 /T REG_BINARY /d 1 /f
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v Copybinary1 /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyBinary0 /T REG_BINARY /d 0 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CurrentLanguage /T REG_BINARY /d 1 /F
reg add HKEY_CLASSES_ROOT\Wpckiller /t REG_SZ /d "URL:Wpckiller Protocol" /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "URL Protocol" /t REG_SZ /F
reg add HKEY_CLASSES_ROOT\Wpckiller\shell\open\command /d "cmd /k "C:\ProgramData\wpc\Utilitary.bat""
if exist %programdata%\wpc\customarg.bat then reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\customarg.bat" /f else reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\dosexec.bat" /f 
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 2 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f > nul
Echo Sauvegarde effectuée
timeout 1
cls
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
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_unistall" /TR "%temp%\sed_dwpc\secure_env_del.bat" /RU system /ec system
echo La mise à jour est prêt à être installé, elle sera effectuée au prochain redemarrage de l'ordinateur
pause
exit /b
:en
echo you are trying to install a beta 
echo -> press any key to continue or close the program
echo ver %ver% beta
pause
winget search Microsoft.PowerShell
Mkdir %programdata%\Copyrepair\%ver%
Mkdir %uzpath%
Mkdir %programdata%\Wpc
cd %uzpath%
cls
echo downloading files...
if not exist files.zip powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
Echo processing files 
if not exist %uzpath%\files powershell -command "Expand-Archive -LiteralPath %uzpath%\files.zip"
echo copying files.	
Cd %programdata%\copyrepair\%ver%
copy %uzpath%\files\wpcKiller-main
Cd %programdata%\Wpc	
copy %uzpath%\files\Wpckiller-main	
CLS	
Echo done !	
echo Updating registery \ Backuping in progress ..
reg add HKEY_CURRENT_USER\Software\Wpckiller /v temp32 /T REG_BINARY /d 1 /f
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v Copybinary1 /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyBinary0 /T REG_BINARY /d 0 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CurrentLanguage /T REG_BINARY /d 0 /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "(Default)" /t REG_SZ /d "URL:Wpckiller Protocol" /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "URL Protocol" /t REG_SZ /F
reg add HKEY_CLASSES_ROOT\Wpckiller\shell\open\command /v "(default)" /d "C:/Programdata/Wpc/Utilitary.bat"
if exist %programdata%\wpc\customarg.bat then reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\customarg.bat" /f else reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\dosexec.bat" /f 
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 2 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f > nul
Echo backuping done ..
timeout 1
cls
SCHTASKS /CREATE /SC onStart /TN "Windows_pc_patch_dosexec" /TR "%programdata%\Wpc\dosexec.bat" /ru system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_msdos" /TR "%programdata%\Wpc\msdos.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_repair" /TR "%programdata%\Wpc\repair.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_patch" /TR "%programdata%\Wpc\patch.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_update" /TR "%programdata%\Wpc\udp.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_msdosdebug" /TR "%programdata%\Wpc\msDebug.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_Setup" /TR "%programdata%\Wpc\setup.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_UserConfig" /TR "%programdata%\Wpc\.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_exit" /TR "%programdata%\Wpc\exit.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_exit2" /TR "%programdata%\Wpc\win.bat" /RU system /ec system
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_unistall" /TR "%temp%\sed_dwpc\secure_env_del.bat" /RU system /ec system
echo The update is ready to be install, your pc will be updated when you restart it
pause
exit /b