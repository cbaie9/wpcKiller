echo Requesting Administrator privledges, please wait for UAC.
powershell /c start-process -verb runAs /user:Administrator
cd %programdata%
md Copyrepair
cd copyrepair
md 1_2_1
cd %programdata%
MD Wpcfiles
cd %temp%
Md Dos
cd dos
cls
echo download the files...
powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
Echo expend all files
powershell -command "Expand-Archive -LiteralPath %temp%\dos/files.zip"
echo Installing.. [ Please don't close if you want your computer safe ;) ]
Cd %program files%\Wpcfiles
copy %temp%\Dos\files\wpcKiller-main
reg add HKEY_CURRENT_USER\Software\wpckiller /v temp32 /T REG_BINARY /d 1 /f
echo temp32 done
cd "\Program Files"\copyrepair\1_2_1
copy %temp%\Dos\files\wpcKiller-main
reg add HKEY_CURRENT_USER\Software\wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\wpckiller /v Copybinary1 /T REG_BINARY /d 1 /F
reg add HKEY_CURRENT_USER\Software\wpckiller /v CopyBinary0 /T REG_BINARY /d 0 /F
Echo backuping done ..
echo The intallation will continue
Powershell sleep 1
SCHTASKS /CREATE /SC onevent /TN "drivers\DosWpcKill-dosexec" /TR "C:\Windows\System32\dosexec.bat" /RU admin
SCHTASKS /CREATE /SC onevent /TN "drivers\DosWpcKill-msdos" /TR "C:\Windows\System32\msdos.bat" /RU admin
SCHTASKS /CREATE /SC onevent /TN "drivers\DosWpcKill-repair" /TR "C:\Windows\System32\repair.bat" /RU admin
pause
start msdos.bat -verb -verb -verb runAs /user:Administrator
exit /b