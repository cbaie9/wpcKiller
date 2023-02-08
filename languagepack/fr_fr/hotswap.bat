if exist %programdata%\wpc\arguments\Unistall goto Unistall
# hotswap français 1.0
:reload
Echo Sauvegarde Terminée 
Echo L'ordinateur va redemarré après la pause ( entrée )
Echo Si vous fermez cette fenêtre, l'installation continuera au prochain démarrage su système
pause
shutdown -s -t 0
:repair
echo Reparage de l'installation
timeout 2
echo Le programme a besoin de redemarrer d'ordinateur pour appliquer le patch
pause
echo redemarrage..
schtasks /change /tn "Windows_pc_patch_dosexec" /enable
SCHTASKS /RUN /TN "Windows_pc_patch_msdos"
exit \b
