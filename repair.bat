echo repair the installation
timeout 2
echo The program need to restart the computer for re-apply the patch
pause
echo rebooting...
schtasks /change /tn "Windows_pc_patch_dosexec" /enable
SCHTASKS /RUN /TN "Windows_pc_patch_msdos"
exit \b
