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
echo "| :a: [Présence](#a-présence)   | L'étudiant.e a fait son travail    :white_check_mark:   |"
echo "| :b: [Précision](#b-précision) | L'étudiant.e a réussi son travail  :tada:               |"

echo ""
echo "## Légende"
echo ""

echo "| Signe              | Signification                 |"
echo "|--------------------|-------------------------------|"
echo "| :white_check_mark: | Prêt à être corrigé           |"
echo "| :x:                | Étape inexistante             |"

echo ""
echo "## Service"
echo ""

echo "| Signe           | État                              | Signification                 |"
echo "|-----------------|-----------------------------------|-------------------------------|"
echo "| :red_circle:    | Active: inactive (dead)           | Inexistant ou inactif         |"
echo "| :orange_circle: | Active: activating (auto-restart) | En cours d'activation         |"
echo "| :green_circle:  | Active: active (running)          | En marche                     |"

RED=":red_circle:"
ORANGE=":orange_circle:"
GREEN=":green_circle:"

echo ""
echo "## :a: Présence"
echo ""
echo "|:hash:| Boréal :id:                | Interne            | ssh | :dvd: LV         | :whale: Docker | :droplet: Kubelet | :minidisc: iSCSI |"
echo "|------|----------------------------|--------------------|-----|------------------|----------------|-------------------|---|"

NOSSH=" :x: | :x: | :x: | :x: | :x: |"

i=0
OK=":white_check_mark:"
KO=":x:"

for id in "${ETUDIANTS[@]}"
do
   VERSION=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVERS[${i}]} lsb_release -a 2>/dev/null`
   # echo $VERSION

   LVG=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVERS[${i}]} sudo lvs ubuntu-vg/iscsi-lv --noheadings 2>/dev/null`
   # echo $LVG

   DOCKER=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVERS[${i}]} systemctl status docker 2>/dev/null`
   # echo $DOCKER

   KUBELET=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVERS[${i}]} systemctl status kubelet 2>/dev/null`
   # echo $KUBELET

   ISCSI=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVERS[${i}]} systemctl status iscsid 2>/dev/null`
   # echo $ISCSI

   VALUE="| ${i} | ${id} - <image src='https://avatars0.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> | \`ssh ${SERVERS[$i]}\` |"

   if [[ $VERSION == *"Ubuntu"* ]]; then

       # --- LVG -------------
       VALUE="${VALUE} ${OK} |"
       if [[ $LVG == *"-wi-a-----"* ]]; then
          VALUE="${VALUE} ${OK} |"
       else
          VALUE="${VALUE} ${KO} |"
       fi

       # --- DOCKER -------------
       if [[ $DOCKER == *"(running)"* ]]; then
          VALUE="${VALUE} ${GREEN} |"
       else
          if [[ $DOCKER == *"(auto-restart)"* ]]; then
             VALUE="${VALUE} ${ORANGE} |"
          else
             VALUE="${VALUE} ${RED} |"
          fi
       fi

       # --- KUBELET -------------
       if [[ $KUBELET == *"(running)"* ]]; then
          VALUE="${VALUE} ${GREEN} |"
       else
          if [[ $KUBELET == *"(auto-restart)"* ]]; then
             VALUE="${VALUE} ${ORANGE} |"
          else
             VALUE="${VALUE} ${RED} |"
          fi
       fi

       # --- ISCSI -------------
       if [[ $ISCSI == *"(running)"* ]]; then
          VALUE="${VALUE} ${GREEN} |"
       else
          if [[ $ISCSI == *"(auto-restart)"* ]]; then
             VALUE="${VALUE} ${ORANGE} |"
          else
             VALUE="${VALUE} ${RED} |"
          fi
       fi

   else
       VALUE="${VALUE} ${KO} | ${NOSSH}"
   fi
   echo ${VALUE}
   let "i++"

done
