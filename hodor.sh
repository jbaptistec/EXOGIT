#!/bin/sh
# récupération du % d'inode utilisées
inode_\%=$(df -i ~/EXOGIT/ |grep -v Filesystem|awk '{print $5}'|sed 's/\%//')
# echo $(df -i ~/EXOGIT/ |grep -v Filesystem|awk '{print $5}'|sed 's/\%//')
# conditions pour lancer l'action
if $inode_\% -ge 80

