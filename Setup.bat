@echo off
echo Requesting Administrator privledges, please wait for UAC.
powershell /c start-process -verb runAs \"%~s0\"
cd "\Program Files"\
md Copyrepair
cd copyrepair
md 1_2_1
cd %temp%
Md Dos
cd dos
cls
echo download the files...
powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
Echo expend all files
powershell -command "Expand-Archive -LiteralPath %temp%\dos"
echo Installing.. [ Please don't close if you want your computer safe ;) ]
Cd %windir%\system32
copy %temp%\dos\wpckiller-main\Wpckiller-main
reg add HKEY_CURRENT_USER\Software\wpckiller /v temp32 /T REG_BINARY /d 1 /f
echo temp32 done
cd "\Program Files"\copyrepair\1_2_1
copy %temp%\dos\wpckiller-main\Wpckiller-main
reg add HKEY_CURRENT_USER\Software\wpckiller /v CopyRepair /T REG_BINARY /d 1 /F
Echo backuping done ..
echo The intallation will continue
Powershell sleep 1
start msdos.bat -verb -verb runAs \"%~s0\"
SCHTASKS /CREATE /SC onstart /TN "drivers\DosWpcKill" /TR "C:\Windows\System32\dosexec.bat" /RU admin
exit /b

