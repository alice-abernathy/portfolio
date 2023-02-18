#!/bin/bash

#!/bin/bash

#define column widths

columnwidth_1=15
columnwidth_2=8
columnwidth_3=8
columnwidth_4=25
columnwidth_5=20

#print table headings

printf "%-${columnwidth_1}s" "username"
printf "%-${columnwidth_2}s" "user id"
printf "%-${columnwidth_3}s" "group id"
printf "%-${columnwidth_4}s" "home"
printf "%-${columnwidth_5}s\n" "shell"

#use awk to format table rows
#

awk -F: -v w1="$columnwidth_1" -v w2="$columnwidth_2" -v w3="$columnwidth_3" -v w4="$columnwidth_4" -v w5="$columnwidth_5" '{

    printf("%-*s", w1, $1);
    printf("%-*s", w2, $2);
    printf("%-*s", w3, $3);
    printf("%-*s", w4, $6);
    printf("%-*s\n", w5, $7);

}' inputfile.txt