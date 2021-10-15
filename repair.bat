echo repair the installation
timeout 2
echo The program need to restart the computer for re-apply the patch
pause
echo rebooting...
schtasks /change /tn "Windows_parental_control_dosexec" /enable
SCHTASKS /RUN /TN "Windows_parental_control_msdos"
exit \b
