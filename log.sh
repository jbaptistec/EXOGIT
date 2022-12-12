#!/bin/sh
count=1  
# n=5
mkdir -p TEST
while [ $count -le 5 ]
do
	nom_de_fichier=$(</dev/random tr -dc 'A-Z-a-z-0-9' | head -c10) 
	echo $(</dev/random tr -dc 'A-Z-a-z-0-9' | head -c10) >> ~/EXOGIT/TEST/$nom_de_fichier
# /var/log/exercice/recent_logs
count=$((count+1))
done
