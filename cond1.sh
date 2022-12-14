#!/bin/bash

IFS=',' read -r -a array <<< "$1"
declare -i res=0
for val in "${array[@]}"; do

  if (( val%2==0 )); then 
    ((res+=val))
  fi
done
echo "$res"

