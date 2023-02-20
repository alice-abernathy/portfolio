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

#no color
RST="\033[0m"

echo -e "${BYLY}"
python progressbar.py
echo -e "${RST}"