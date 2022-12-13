#!/bin/sh
# récupération du % d'inode utilisées
inode_used=$(df -i ~/EXOGIT/ |grep -v Filesystem|awk '{print $5}'|sed 's/\%//')

#initialisation de la limite
n=$limit_stock

# echo $(df -i ~/EXOGIT/ |grep -v Filesystem|awk '{print $5}'|sed 's/\%//')
# echo $inode_used

# conditions pour lancer l'action
if $inode_used -ge n; then
	# création du directory
	mkdir -p /var/log/exercice/archives/
	# création du nom du fichier archivage
	fichier_archive=$(mktemp -u XXXXXXXXXXX)
	# création du fichier archivage
	touch /var/log/exercice/archives/$fichier_archive
	# compression et archivage dans le fichier archivage créé
	tar -czvf /var/log/exercice/archives/archi /var/log/exercice/recent_logs	# affichage du message sur tous les terminaux ouvert sur la machine
	wall "HODOOOR !!!"
fi

# arrêt de start si malgrès l'archivage et compression la quantité d'inode utilisé est toujours trop importante
if $inode_used -ge n; then
	kill $(pgrep start.sh)
	echo "Plus d'inode disponible, arrêt de start.sh"
	crontab -r
fi
 
