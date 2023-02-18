#/bin/bash
#V2.2 

#5.5
#Now write a script named “UserAccounts.sh” to take a look at the “/etc/passwd” file and format it into a neat table similar to the one from task 5.4
#Use Regex to make the  “UserAccounts.sh” awk script filter the data to only show users who have “/bin/bash” listed as their default shell.


#awk filter included
#headings have colour
#to add more colour will need alot of work as escape codes to add colour wrecks the column widths

#set column widths

columnwidth_1=20
columnwidth_2=10
columnwidth_3=12
columnwidth_4=40
columnwidth_5=30

tableLINE() 
{
  n=110
  printf '%*s\n' $n | tr ' ' '_'
}

#print table top line

echo ""
echo ""
tableLINE

# print table headings

printf "%-${columnwidth_1}s" "| $(tput setaf 4)Username$(tput sgr0)          "
printf "%-${columnwidth_2}s" "| $(tput setaf 4)User ID$(tput sgr0) "
printf "%-${columnwidth_3}s" "| $(tput setaf 4)Group ID$(tput sgr0)  "
printf "%-${columnwidth_4}s" "| $(tput setaf 4)Home$(tput sgr0)                                  "
printf "%-${columnwidth_5}s\n" "| $(tput setaf 4)Shell$(tput sgr0)                    |"

#print table separator

tableLINE

#use awk to format table rows
awk -F: -v w1="$columnwidth_1" -v w2="$columnwidth_2" -v w3="$columnwidth_3" -v w4="$columnwidth_4" -v w5="$columnwidth_5" '

$7 == "/bin/bash" {

     printf("%-*s", w1, "| " $1);
     printf("%-*s", w2, "| " $3);
     printf("%-*s", w3, "| " $4);
     printf("%-*s", w4, "| " $6);
     printf("%-*s\n", w5, "| "$7 "                |");

}' inputfile.txt 

# print table footer

tableLINE
echo ""
echo ""
