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

#initialisation de la limite du %age d'inodes utilisés max 
echo "Quelle limite de stockage souhaitez-vous fixer"
read limit_stock

#vérification que c'est un nombre non null ou = 0
while $limit_stock=NULL || $limit_stock=0
do
        echo "limit_stock ne peut-être NULL ou égal à 0"
        echo "Combien souhaitez-vous créer de fichier par execution de log.sh"
	echo "Quelle limite de stockage souhaitez-vous fixer"
	read limit_stock
done


line="* * * * * sudo bash /home/jbaptistec/EXOGIT/log.sh $nb_voulu"
(crontab -u root -l; echo "$line") | crontab -u root

line="*/5 * * * * sudo bash /home/jbaptistec/EXOGIT/hodor.sh $limit_stock"
(crontab -u root -l; echo "$line") | crontab -u root

