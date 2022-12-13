#!/bin/sh
count=1  
# définition du nombre de fichier à créer > paramètre à entrer
n=$nb_voulu
mkdir -p /var/log/exercice/recent_logs
# mkdir -p TEST
while [ $count -le $n ]
do
	nom_de_fichier=$(</dev/random tr -dc 'A-Z-a-z-0-9' | head -c10) 
	echo $(</dev/random tr -dc 'A-Z-a-z-0-9' | head -c10) >> /var/log/exercice/recent_logs/$nom_de_fichier
	# echo $(</dev/random tr -dc 'A-Z-a-z-0-9' | head -c10) >> TEST/$nom_de_fichier
count=$((count+1))
done
