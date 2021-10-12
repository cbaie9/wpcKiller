echo not working 
pause
exit
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
echo Get admin permission, let's go
cd %programdata%
md Copyrepair
cd copyrepair
md 1_2_1
cd %programdata%
MD Wpc
cd %temp%
Md Dos
cd dos
cls
echo download the files...
powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
Echo expend all files
powershell -command "Expand-Archive -LiteralPath %temp%\dos/files.zip"
echo Installing.. [ Please don't close if you want your computer safe ;) ]
echo copying files.	
Cd %program files%\Wpcfiles
copy %temp%\Dos\files\wpcKiller-main
Cd %programdata%\Wpc	
copy %temp%\dos\files\Wpckiller-main	
CLS	
Echo done !	
echo Updating registery \ Backuping in progress ..
reg add HKEY_CURRENT_USER\Software\wpckiller /v temp32 /T REG_BINARY /d 1 /f
echo temp32 done
cd "\Program Files"\copyrepair\1_2_1
copy %temp%\Dos\files\wpcKiller-main
reg add HKEY_CURRENT_USER\Software\wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\wpckiller /v Copybinary1 /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\wpckiller /v CopyBinary0 /T REG_BINARY /d 0 /F
Echo backuping done ..
timeout 1
cls
echo The intallation will continue
SCHTASKS /CREATE /SC onevent /TN "wpc_dox" /TR "%programdata%\Wpc\exec\dosexec.bat" /s system   false
SCHTASKS /CREATE /SC onevent /TN "wpc_msd" /TR "%programdata%\Wpc\msdos.bat" /RU admin
SCHTASKS /CREATE /SC onevent /TN "wpc_rep" /TR "%programdata%\Wpc\repair.bat" /RU admin
pause
start msdos.bat -verb -verb -verb runAs /user:Administrator
exit /b

