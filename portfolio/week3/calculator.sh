#!/bin/bash

#Define colors
BLK="\033[30m"

RED="\033[31m"

GRN="\033[32m"

BRN="\033[33m"

BLU="\033[34m"

PRPL="\033[35m"

CYN="\033[36m"

GRY="\033[37m"

YLW="\033[1;33m"

ORG="\033[0;33m"

LBLU="\033[1;34m"

#no color
RST="\033[0m"

while :
do

# 

echo
echo -e "${LBLU}SIMPLE BASH CALCULATOR${RST}"
echo -e "Enter 1st number: "
read A
echo -e "Enter 2nd number: "
read B
echo
 
# 


echo -e "${YLW}ARITHMETIC OPERATION${RST}"
echo -e "${ORG}Please enter your choice${RST}"
echo -e "Press 1 for ${BLU}Addition${RST}"
echo -e "Press 2 for ${GRN}Subtraction${RST}"
echo -e "Press 3 for ${RED}Multiplication${RST}"
echo -e "Press 4 for ${PRPL}Division${RST}"
echo -e "Or press ${YLW}q${RST} to quit"
echo
read -r OPERATION

 
# 
case $OPERATION in
  1)echo -e ${BLU}
    echo "$A + 
$B"
    result=$((A+B))
  ;;

  2)echo -e ${GRN}
    echo "$A -
$B"
    result=$((A-B))
  ;;

  3)echo -e ${RED}
    echo "$A * 
$B"
    result=$((A*B))
  ;;

  4)echo -e ${PRPL}

    if [ $B = 0 ]; then
    echo -e "${YLW}Divide by zero is not allowed${RST}"
    echo
  
    
    else
    
    echo "$A / 
$B"
    result=$((A/B))
    
    fi
  ;;

  q)  echo
        echo "Bye"
        echo
        exit ;;

  Q)  echo
        echo "Bye"
        echo
        exit ;;
  
  *) echo -e "${ORG}Invalid input or calculation ${YLW}(DIV/0)${RST}"

  ;;
	
esac



echo -e "= $result${RST}"
echo

done