#!/bin/bash


# Name of the text file containing the HTML source code
file=cvealerts.txt

html=$(cat $file)


cardtitle=$(echo "$html" | grep -o '<h3 class="sc-card-title">.*</h3>')

html=

carddate=$(echo "$html" | grep -o '<div class="sc-card-publish">.*</div>')
carddesc=$(echo "$html" | grep -o '<p class="sc-card-desc">.*</p>')

# Print the extracted information

echo -e "Title: $cardtitle"
echo -e "Date: $carddate"
echo -e "$carddesc"
echo -e
