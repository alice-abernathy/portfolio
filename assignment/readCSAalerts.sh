#!/bin/bash


# Name of the text file containing the HTML source code
file=CSAalerts.txt

html=$(cat $file)


cardtitle=$(echo "$html" | grep -o '<h3 class="sc-card-title">.*</h3>' | sed -e 's/<h3 class="sc-card-title">//g' -e 's/<\/h3>//g')

echo -e "$cardtitle"

carddate=$(echo "$html" | grep -o '<div class="sc-card-publish">.*</div>' | sed -e 's/<div class="sc-card-publish">//g' -e 's/<\/div>//g')

echo -e "$carddate"

carddesc=$(echo "$html" | grep -o '<p class="sc-card-desc">.*</p>' | sed -e 's/<p class="sc-card-desc">//g' -e 's/<\/p>//g')

echo -e "$carddesc"






# Print the extracted information

#echo -e "$cardtitle"
#echo -e "$carddate"
#echo -e "$carddesc"
#echo -e
