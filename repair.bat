REG QUERY "HKEY_CURRENT_USER\Software\Wpckiller" /v "CurrentLanguage" | Find "0x0"
IF %ERRORLEVEL% == 1 goto rep_fr
If %ERRORLEVEL% == 0 goto rep_en
:rep_en
echo repair the installation
timeout 2
echo The program need to restart the computer for re-apply the patch
pause
echo rebooting...
schtasks /change /tn "Windows_pc_patch_dosexec" /enable
SCHTASKS /RUN /TN "Windows_pc_patch_msdos"
exit \b
:rep_fr 
echo Réparer l'installation
timeout 2
echo Le programme à besoin de redemarrer l'action 
pause
echo redémarrage...
schtasks /change /tn "Windows_pc_patch_dosexec" /enable
SCHTASKS /RUN /TN "Windows_pc_patch_msdos"
exit \b
