#!/bin/bash

if [[ -z $1 ]]; then echo "Reqired input temperature as arg1" ; exit 1 ; fi

arg1=$1
res=0
if [[ ${arg1:((${#arg1}-1)):1} = "C" ]]; then
    ((res=${arg1:0:((${#arg1}-1))}+273))
    echo $res"K"
elif [[ ${arg1:((${#arg1}-1)):1} = "K" ]]; then
    ((res=${arg1:0:((${#arg1}-1))}-273))
     echo $res"C"
fi


