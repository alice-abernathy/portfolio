#!/bin/bash
#the purpose of this script is to scrape the CSA website shown below
#the command 'curl' was used as I was scraping a https website

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


url="https://www.csa.gov.sg/alerts-advisories/alerts" #CSA keep changing this

#use curl to retrieve the HTML content of the website and save it to a file called “CSAalerts.txt"
#the "-s" option tells curl to run silently, without showing progress or errors

curl -s $url -o CSAalerts.txt

#display a message indicating that the download is complete

echo 
echo -e "${BBLU}Download complete${RST}"
echo
