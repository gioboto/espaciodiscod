#!/bin/bash
#
#script espaciodisco.sh
# Version : 1.0
#envia alertas si particiones de disocs mas de cierto porcentaje
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 2021-10-10

#script espaciodisco.sh
#envia alertas si particiones de disocs mas de cierto porcentaje



PATH=/bin:/usr/bin:/usr/sbin/

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  usoparticion=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  parti$output | awk '{ print $2 }' )
# si mas del 75 porcientode uso en las particiones , envio aleta
  if [ $usoparticion -ge 75 ]; then
    MENSAJE=`echo "Aletar de espacio en disco \"$particion ($usoparticion%)\" en $(hostname) a la fecha $(date)"` #|
   #  mail -s "Alert: Almost out of disk space $usep%" you@somewhere.com
	TOKEN="569774679:AAEl8uSwPNDzHwM_MCCR1-iXi4C6zLGeoqU"
	ID="152054272"
	
	URL="https://api.telegram.org/bot$TOKEN/sendMessage"
	curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"  > /dev/null
  fi
done
