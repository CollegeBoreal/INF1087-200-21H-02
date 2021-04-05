#!/bin/sh

COULEURS=(
":red_circle:"
":orange_circle:"
":green_circle:"
)

SERVICE="docker"
SERVER="localhost"

statut_du_service() {
  RETOUR=`ssh -i ~/.ssh/b300098957@ramena.pk \
     -o StrictHostKeyChecking=no \
     -o PasswordAuthentication=no \
     -o ConnectTimeout=5 ${SERVERS[${i}]} systemctl status ${SERVICE} 2>/dev/null`
  # echo ${RETOUR}
  COULEUR=0
  # --- DOCKER -------------
  if [[ ${RETOUR} == *"(running)"* ]]; then
     COULEUR=2
  else
     if [[ ${RETOUR} == *"(auto-restart)"* ]]; then
        COULEUR=1
     fi
  fi
  return ${COULEUR}
}

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


echo ""
echo "## :a: Présence"
echo ""
echo "|:hash:| Boréal :id: | Interne | ssh | :whale: Docker | :droplet: Kubelet |:dvd: LV        | :minidisc: iSCSI  |"
echo "|------|-------------|---------|-----|----------------|-------------------|----------------|-------------------|"

NOSSH=" :x: | :x: | :x: | :x: | :x: |"

i=0
OK=":white_check_mark:"
KO=":x:"

for id in "${ETUDIANTS[@]}"
do
   SERVER=${SERVERS[${i}]}

   VERSION=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVER} lsb_release -a 2>/dev/null`
   # echo $VERSION

   SERVICE="docker"
   statut_du_service
   DOCKER=$?
   #echo $DOCKER

   SERVICE="kubelet"
   statut_du_service
   KUBELET=$?
   # echo $KUBELET

   LVG=`ssh -i ~/.ssh/b300098957@ramena.pk \
        -o StrictHostKeyChecking=no \
        -o PasswordAuthentication=no \
        -o ConnectTimeout=5 ${SERVER} sudo lvs ubuntu-vg/iscsi-lv --noheadings 2>/dev/null`
   # echo $LVG

   SERVICE="iscsid"
   statut_du_service
   ISCSI=$?
   # echo $ISCSI


   VALUE="| ${i} | ${id} - <image src='https://avatars0.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> | \`ssh ${SERVER}\` |"

   if [[ $VERSION == *"Ubuntu"* ]]; then

       # --- SSH -------------
       VALUE="${VALUE} ${OK} |"

       # --- DOCKER -------------
       VALUE="${VALUE} ${COULEURS[${DOCKER}]} |"

       # --- KUBELET -------------
       VALUE="${VALUE} ${COULEURS[${KUBELET}]} |"

       # --- LVG -------------
       if [[ $LVG == *"-wi-a-----"* ]]; then
          VALUE="${VALUE} ${OK} |"
       else
          VALUE="${VALUE} ${KO} |"
       fi

       # --- ISCSI -------------
       VALUE="${VALUE} ${COULEURS[${ISCSI}]} |"

   else
       VALUE="${VALUE} ${KO} | ${NOSSH}"
   fi
   echo ${VALUE}
   let "i++"

done
