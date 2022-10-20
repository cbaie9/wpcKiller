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
del Wpc.dll /Q
del WpcMon.exe.mui /Q
del WpcMon.exe /Q
del WpcApi.dll /Q
del WpcWebfilter.dll /Q
del WpcDesktopMonSvc.dll /Q
del Wpctok.exe /Q
del WpcRefreshTask.dll /Q
del Wpc.dll.mui /Q
del WpcProxyStubs.dll /Q
del WpcRefresh.dll.mui /Q
del Wpcatltoast.png /Q
del Wpcmon.png /Q
cd fr-FR
del WpcMon.exe.mui /Q
del Wpc.Dll.mui /q
del WpcRefreshTask.dll /Q
cd %systemroot%\system32\migration
del WpcMigration.uplevel.dll /q
rmdir %systemroot%\WinSxS\amd64_dual_wpcip.inf_31bf3856ad364e35_10.0.22000.318_none_b9933c4a406b3dc8
del %systemroot%\WinSxS\amd64_microsoft-windows-p..trols-wpcproxystubs_31bf3856ad364e35_10.0.22000.1_none_2c0ccfb66f88abfb\WpcProxyStubs.dll /q
del %systemroot%\WinSxS\amd64_wpcip.inf.resources_31bf3856ad364e35_10.0.22000.1_fr-fr_54d5b3cdc7780631\wpcip.inf_loc /q
rmdir %systemroot%\WinSxS\wow64_microsoft-windows-p..lcontrols-webfilter_31bf3856ad364e35_10.0.22000.318_none_3103f122dcfac4fc
Del C:\Windows\SysWOW64\WpcWebFilter.dll /q
echo done ;)
powershell sleep 1
