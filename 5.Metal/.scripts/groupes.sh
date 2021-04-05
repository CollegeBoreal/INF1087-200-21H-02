#!/bin/bash

# --------------------------------------
# Fonctions 
#
#
# --------------------------------------
CHIFFRES=(
":zero:"
":one:"
":two:"
":three:"
":four:"
)

GROUPE="boreal"

# --------------------------------------
#
#
#
# --------------------------------------

source .scripts/grappes.sh --source-only
   
echo "# Participation du groupe au `date +"%d-%m-%Y %H:%M"`"
echo ""


echo "| Table des matières            | Description                                             |"
echo "|-------------------------------|---------------------------------------------------------|"
echo "| :a: [Présence](#a-présence)   | Le groupe a fait le travail        :white_check_mark:   |"
echo "| :b: [Précision](#b-précision) | Le groupe a réussi son travail     :tada:               |"

echo ""
echo "## Légende"
echo ""

echo "| Signe              | Signification                 |"
echo "|--------------------|-------------------------------|"
echo "| :white_check_mark: | Prêt à être corrigé           |"
echo "| :x:                | Étape inexistante             |"

echo ""
echo "## :a: Présence"
echo ""
echo "|:hash:| Grappe :wheel_of_dharma: | :gear: Config | :roll_of_paper: BlockDevice |"
echo "|------|--------------------------|---------------|-----------------------------|"

i=0
y=0
OK=":white_check_mark:"
KO=":x:"

for grappe in "${GRAPPES[@]}"
do

   let "y++"
   FOLDER=${DIR[${i}]}.${grappe}

   VALUE="| ${CHIFFRES[${y}]} | [${FOLDER}](${FOLDER}) |"

   echo ${VALUE}
   let "i++"

done
