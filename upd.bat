setlocal enableextensions
set ver=1_7_0
md %temp%\dos\upd
cd %temp%\dos\upd
echo downloading the files...
if not exist files.zip powershell -Command "Invoke-WebRequest https://github.com/cbaie9/wpcKiller/archive/refs/heads/main.zip -Outfile  files.zip"
Echo processing files... 
if not exist %temp%\dos\files powershell -command "Expand-Archive -LiteralPath %temp%\dos/files.zip"
echo copying files.	
Cd %programdata%\copyrepair\%ver%
Echo copying cd 
copy %temp%\Dos\upd\files\wpcKiller-main
Cd %programdata%\Wpc	
copy %temp%\dos\upd\files\Wpckiller-main 
# no major fix in core no need to re-install
exit /b 

