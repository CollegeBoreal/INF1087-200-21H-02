#!/bin/sh

# --------------------------------------
#
#
#
# --------------------------------------

source ../.scripts/students.sh --source-only
   
echo "# Participation au `date +"%d-%m-%Y %H:%M"`"
echo ""


echo "| Table des matières            | Description                                             |"
echo "|-------------------------------|---------------------------------------------------------|"
echo "| :a: [Présence](#a-présence)   | L'étudiant.e a fait son travail    :heavy_check_mark:   |"
echo "| :b: [Précision](#b-précision) | L'étudiant.e a réussi son travail  :tada:               |"

echo ""
echo "## Légende"
echo ""

echo "| Signe              | Signification                 |"
echo "|--------------------|-------------------------------|"
echo "| :heavy_check_mark: | Prêt à être corrigé           |"
echo "| :x:                | Projet inexistant             |"


echo ""
echo "## :a: Présence"
echo ""
echo "|:hash:| Boréal :id:                | Interne            | ssh | Docker Engine | LVG |"
echo "|------|----------------------------|--------------------|-----|---------------|-----|"

NOSSH=" :x: | :x: | :x |"

i=0
OK=":heavy_check_mark:"
KO=":x:"

for id in "${ETUDIANTS[@]}"
do
   VERSION=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVERS[${i}]} lsb_release -a 2>/dev/null`
   # echo $VERSION

   DOCKER=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVERS[${i}]} systemctl status docker 2>/dev/null`
   # echo $DOCKER

   LVG=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVERS[${i}]} sudo lvs ubuntu-vg/iscsi-lv --noheadings 2>/dev/null`
   # echo $LVG

   VALUE="| ${i} | ${id} - <image src='https://avatars0.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> | \`ssh ${SERVERS[$i]}\` |"

   if [[ $VERSION == *"Ubuntu"* ]]; then
       VALUE="${VALUE} ${OK} |"
       if [[ $DOCKER == *"(running)"* ]]; then
          VALUE="${VALUE} ${OK} |"
       else
          VALUE="${VALUE} ${KO} |"
       fi
       if [[ $LVG == *"-wi-a-----"* ]]; then
          VALUE="${VALUE} ${OK} |"
       else
          VALUE="${VALUE} ${KO} |"
       fi
   else
       VALUE="${VALUE} ${KO} | ${NOSSH}"
   fi
   echo ${VALUE}
   let "i++"

done
