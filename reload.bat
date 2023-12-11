# this file reload the custom argument you can set in custom_iagree_arg.bat
# do not change too much this file because of the next update :>
setlocal enableextensions
cd /D %~dp0
if not exist "getadmin.vbs" (
    mode con lines=2 cols=30
    echo Set UAC = CreateObject^("Shell.Application"^)>getadmin.vbs
    echo UAC.ShellExecute %0, "", "", "runas", 1 >>getadmin.vbs
    call wscript getadmin.vbs
    exit
    )
del getadmin.vbs
# admin script start here
# alpha user
set alpha=false
if %alpha%=
REG QUERY "HKEY_CURRENT_USER\Software\Wpckiller" /v "CurrentLanguage" | Find "0x0"
IF %ERRORLEVEL% == 1 goto rel_fr
If %ERRORLEVEL% == 0 goto rel_en
:rel_en
if exist %programdata%\wpc\arguments\customarg.bat then reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\customarg.bat" /f else reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\dosexec.bat" /f & echo Arguments loaded
echo Updating registery \ Backuping in progress ..
reg add HKEY_CURRENT_USER\Software\Wpckiller /v temp32 /T REG_BINARY /d 1 /f
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CLASSES_ROOT\Wpckiller /t REG_SZ /d "URL:Wpckiller Protocol" /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "URL Protocol" /t REG_SZ /F
reg add HKEY_CLASSES_ROOT\Wpckiller\shell\open\command /d "cmd /k "C:\ProgramData\wpc\Utilitary.bat"" 
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 2 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f > nul
Echo backuping done .. 
Echo The computer will restart now after the timeout
Echo If you close this windows the installation will continue on next startup
pause
shutdown -r -t 0
:rel_fr
if exist %programdata%\wpc\arguments\customarg.bat then reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\customarg.bat" /f else reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\dosexec.bat" /f  & echo Argument Chargées
echo Mise à jour du registre 
reg add HKEY_CURRENT_USER\Software\Wpckiller /v temp32 /T REG_BINARY /d 1 /f
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CLASSES_ROOT\Wpckiller /t REG_SZ /d "URL:Wpckiller Protocol" /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "URL Protocol" /t REG_SZ /F
reg add HKEY_CLASSES_ROOT\Wpckiller\shell\open\command /d "cmd /k "C:\ProgramData\wpc\Utilitary.bat"" 
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 2 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f > nul
Echo Mise à jour du registre terminée
Echo Protocole Wpc installé (via registre)
Echo L'ordinateur va maintenant redémarrer pour appliquer les modifications
Echo Si vous fermez cette fenêtre l'installation se continura au prochain redémarrage, si vous continuer l'ordinateur redemararera maintenant
pause
shutdown -r -t 0