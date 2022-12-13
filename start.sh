#!/bin/sh

#initialisation de nb de fichier à créer par réitération
echo "Combien souhaitez-vous créer de fichier par execution de log.sh"
read nb_voulu

#vérification que c'est un nombre non null ou = 0
while $nb_voulu=NULL || $nb_voulu=0
do
	echo "nb_voulu ne peut-être NULL ou égal à 0"
	echo "Combien souhaitez-vous créer de fichier par execution de log.sh"
	read nb_voulu
done

line="* * * * * /home/jbaptistec/EXOGIT/log.sh"
(crontab -u $(whoami) -l; echo "$line") | crontab -u $(whoami)

line="*/5 * * * * /home/jbaptistec/EXOGIT/hodor.sh"
(crontab -u $(whoami) -l; echo "$line") | crontab -u $(whoami)


