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

line="* * * * * sudo bash /home/jbaptistec/EXOGIT/log.sh $nb_voulu"
(crontab -u root -l; echo "$line") | crontab -u root

line="*/5 * * * * sudo bash /home/jbaptistec/EXOGIT/hodor.sh"
(crontab -u root -l; echo "$line") | crontab -u root

