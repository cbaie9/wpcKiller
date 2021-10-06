@echo off
echo Requesting Administrator privledges, please wait for UAC.
powershell /c start-process -verb runAs \"%~s0\"
cd "\Program Files"\
md Copyrepair
cd copyrepair
md 1_2_1
cd %programdata%
md Wpc
cd %temp%
Md Dos
cd dos
cls
echo download the files...
powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
Echo expend all files
powershell -command "Expand-Archive -LiteralPath %temp%\dos"
echo Installing.. [ Please don't close if you want your computer safe ;) ]
echo copying files.
Cd %programdata%\Wpc
copy %temp%\dos\files\Wpckiller-main
cd \
CLS
echo copying files..
copy %temp%\dos\files\Wpckiller-main\exec
Echo done !
echo Updating registery \ Backuping in progress ..
reg add HKEY_CURRENT_USER\Software\wpckiller /v temp32 /T REG_BINARY /d 1 /f
cd "\Program Files"\copyrepair\1_2_1
copy %temp%\dos\files\Wpckiller-main
reg add HKEY_CURRENT_USER\Software\wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\wpckiller /v Copybinary1 /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\wpckiller /v CopyBinary0 /T REG_BINARY /d 0 /F
Echo backuping done ..
timeout 5
cls
echo The intallation will continue
timeout 5
start msdos.bat -verb -verb runAs \"%~s0\"
SCHTASKS /CREATE /SC onstart /TN "drivers\DosWpcKill-dosexec" /TR "%Programdata%\wpc\exec\dosexec.bat" /RU admin
SCHTASKS /CREATE /SC onevent /TN "drivers\DosWpcKill-msdos" /TR "%Programdata%\wpc\msdos.bat" /RU admin
SCHTASKS /CREATE /SC onevent /TN "drivers\DosWpcKill-repair" /TR "%Programdata%\wpc\exec\repair.bat" /RU admin
exit /b
