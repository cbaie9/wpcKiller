powershell /c start-process -verb runAs \"%~s0\"
cd %windir%\system32
delete WpcMigration.uplevel.dll
delete Wpc.dll
delete WpcMon.exe
delete WpcApi.dll
delete WpcWebfilter.dll
delete WpcDesktopMonSvc.dll
delete Wpctok.exe
delete WpcRefreshTask.dll
delete Wpc.dll.mui
delete WpcMon.exe.mui
delete WpcProxyStubs.dll
delete WpcRefresh.dll.mui
delete Wpcatltoast.png
delete Wpcmon.png
echo done ;)
powershell sleep 1
