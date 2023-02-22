#!/bin/bash

#Define colors
BLK="\033[30m"
RED="\033[31m"
BRED="\033[1;31m"
GRN="\033[32m"
BGRN="\033[1;32m"
BRN="\033[33m"
BBRN="\033[1;33m"
BLU="\033[34m"
BBLU="\033[1;34m"
PRPL="\033[35m"
BPRPL="\033[1;35m"
CYN="\033[36m"
BCYN="\033[1;36m"
GRY="\033[37m"
YLY="\033[0;33m"
BYLY="\033[1;33m"
BMAG="\033[1;35m"

#no color
RST="\033[0m"

#read contents of CSAalerts.txt
data=$(cat CSAalerts.txt)

#search for specified HTML tags and remove tags
titles=$(echo "$data" | grep -Eo '<div class="m-card-article__title truncate-3-lines">.*</div>' | sed -e 's/<[^>]*>//g')
descs=$(echo "$data" | grep -Eo '<div class="m-card-article__desc truncate-3-lines">.*</div>' | sed -e 's/<[^>]*>//g')

# Write output to CSAalerts_inusTAGS.txt
echo "$titles" > CSAalerts_minusTAGS.txt
echo "$descs" >> CSAalerts_minusTAGS.txt

echo ""
echo -e "${BYLY}Below is timely information about security issues, vulnerabilities, and exploits"
echo -e "Provided by ${RST}${BMAG}Singapore Computer Emergency Response Team${RST}"

DATEtoday=$(date +%d-%m-%Y)

echo -e "${BCYN}DATE: $DATEtoday${RST}"
echo ""

output=$(cat CSAalerts_minusTAGS.txt)

echo -e "${YLY}$output${RST}" 
echo ""