# this file reload the custom argument you can set in custom_iagree_arg.bat

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
if exist %programdata%\wpc\customarg.bat then reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\customarg.bat" /f else reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %programdata%\Wpc\dosexec.bat" /f 
echo Updating registery \ Backuping in progress ..
reg add HKEY_CURRENT_USER\Software\Wpckiller /v temp32 /T REG_BINARY /d 1 /f
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v Copybinary1 /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\Wpckiller /v CopyBinary0 /T REG_BINARY /d 0 /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "(Default)" /t REG_SZ /d "URL:Wpckiller Protocol" /F
reg add HKEY_CLASSES_ROOT\Wpckiller /v "URL Protocol" /t REG_SZ /F
reg add HKEY_CLASSES_ROOT\Wpckiller\shell\open\command /v "(default)" /d "C:/Programdata/Wpc/udp.bat" 
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 2 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f > nul
if
Echo backuping done .. 
Echo The computer will restart now after the timeout
Echo If you close this windows the installation will continue on next startup
pause
shutdown -s -t 0