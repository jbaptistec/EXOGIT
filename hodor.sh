#!/bin/sh
# récupération du % d'inode utilisées
inode_used=$(df -i ~/EXOGIT/ |grep -v Filesystem|awk '{print $5}'|sed 's/\%//')
# echo $(df -i ~/EXOGIT/ |grep -v Filesystem|awk '{print $5}'|sed 's/\%//')
# echo $inode_used

# création fichier archivage
# vérification préalable : vérification de l'existence d'un dossier d'archivage
if [ ! -d "/var/log/exercice/archives"]; then
	# création du directory
	mkdir -p /var/log/exercice/archives/
	# création du nom du fichier archivage
	fichier_archive=$(mktemp -u XXXXXXXXXXX)
	# création du fichier archivage
	touch /var/log/exercice/archives/$fichier_archive
	#création d'un alias permanent définissant le nom unique du fichier archivage
	echo 'alias archi="$fichier_archive"' >> ~/.zshrc
	# prise en compte alias après ajout
	source ~/.zshrc
fi


# conditions pour lancer l'action
if $inode_used -ge 20; then
	# compression et archivage dans le fichier archivage créé
	tar -czvf /var/log/exercice/archives/archi /var/log/exercice/recent_logs	# affichage du message sur tous les terminaux ouvert sur la machine
	wall "HODOOOR !!!"
fi

# arrêt de start si malgrès l'archivage et compression la quantité d'inode utilisé est toujours trop importante
if $inode_used -ge 20; then
	kill $(pgrep start.sh)
fi
 
