#!/bin/bash
#V2 
#increase column widths, V1 showed data can be very long
#add table

#set column widths
columnwidth_1=20
columnwidth_2=10
columnwidth_3=10
columnwidth_4=30
columnwidth_5=30

#define side bars

LEFT_BAR="_"
RIGHT_BAR="_"

#print top line

printf "%s%s%s%s%s%s%s%s%s%s%s\n" "$LEFT_BAR" "$(printf '%*s' "$columnwidth_1" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$columnwidth_2" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$columnwidth_3" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$columnwidth_4" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$columnwidth_5" "" | tr ' ' '-')" "$RIGHT_BAR"

#print table headings

printf "%s%s%s%s%s%s%s%s%s%s%s\n" "$LEFT_BAR" "username" \
        "$(printf '%*s' "$((columnwidth_1 - 8))" "" | tr ' ' ' ')" \
        "user id" \
        "$(printf '%*s' "$((columnwidth_3 - 8))" "" | tr ' ' ' ')" \
        "group id" \
        "$(printf '%*s' "$((columnwidth_4 - 4))" "" | tr ' ' ' ')" \
        "home" \
        "$(printf '%*s' "$((columnwidth_5 - 4))" "" | tr ' ' ' ')" \
        "shell" "$RIGHT_BAR"

#print middle line

printf "%s%s%s%s%s%s%s%s%s%s%s\n" "$LEFT_BAR" "$(printf '%*s' "$columnwidth_1" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$columnwidth_2" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$columnwidth_3" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$columnwidth_4" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$columnwidth_5" "" | tr ' ' '-')" "$RIGHT_BAR"

#use awk to format table rows and filter by shell

awk -F: -v w1="$columnwidth_1" -v w2="$columnwidth_2" -v w3="$columnwidth_3" -v w4="$columnwidth_4" -v w5="$columnwidth_5" '
    $7 == "/bin/bash" {
        printf("%s%-*s", LEFT_BAR, w1, $1);
        printf("%s%*s", LEFT_BAR, w2, $3);
        printf("%s%*s", LEFT_BAR, w3, $4);
        printf("%s%-*s", LEFT_BAR, w4, $6);
        printf("%s%-*s%s\n", LEFT_BAR, w5, $7, RIGHT_BAR);
    }' inputfile.txt

#print bottom line

printf "%s%s%s%s%s%s%s%s%s%s%s\n" "$LEFT_BAR" "$(printf '%*s' "$COL_WIDTH_1" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$COL_WIDTH_2" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$COL_WIDTH_3" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$COL_WIDTH_4" "" | tr ' ' '-')" \
        "$LEFT_BAR" "$(printf '%*s' "$COL_WIDTH_5" "" | tr ' ' '-')" "$RIGHT_BAR"