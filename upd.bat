setlocal enableextensions
set ver=1.8.0
md %temp%\dos\upd
cd %temp%\dos\
echo downloading the files...
if not exist files.zip powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files_%ver%.zip"
Echo processing files... 
if not exist %temp%/dos/files_%ver% powershell -command "Expand-Archive -LiteralPath %temp%/dos/files_%ver%.zip"
echo copying files.	
Cd %programdata%\copyrepair\%ver%
Echo copying cd 
copy %temp%\Dos\upd\files_%ver%\wpcKiller-main
Cd %programdata%\Wpc	
copy %temp%\dos\upd\files_%ver%\Wpckiller-main 
echo no major fix in core no need to re-install
pause
exit /b 
