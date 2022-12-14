#!/bin/bash
#var1="1"; var2="2" ; var3="3" ; printf 'Numbers: %s Symbols: %s Letters: %s\n' $var1 $var2 $var3
OLD_IFS=$IFS
if [[ -z $1 ]]; then echo "Reqired input parameter" ; exit 1 ; fi
# new_str=""
# IFS=' ' read -r -a array <<< "$1"
# for val in "${array[@]}"; do
#     new_str+=$val
# done
# echo $new_str
new_str=${1// /}
#echo $new_str

has_digit='[0-9]'
has_letter='[a-zA-Z]'
has_special='[*!@#$%^&()_+]'

declare -i letters=0
declare -i digits=0
declare -i specials=0


while read -n1 char;  do 
    #echo "my letter is $char"
    if [[ "$char" =~ $has_letter ]]; then
        ((letters+=1))
    elif [[ "$char" =~ $has_digit ]]; then
        ((digits+=1))
    elif [[ "$char" =~ $has_special ]]; then
        ((specials+=1))
    fi
done < <(echo -n "$new_str")
# echo "let:"$letters
# echo "dig:"$digits
# echo "spec:"$specials
printf 'Numbers: %s Symbols: %s Letters: %s\n' $digits $specials $letters
echo "Numbers: 3 Symbols: 2 Letters: 5"

IFS=$OLD_IFS
