#!/bin/bash

LENGTH=$1

if [ "${LENGTH}" == "" ]; then
LENGTH="15"
fi

if [ "${LENGTH}" -le "7" ]; then
LENGTH="8"
echo "Passwd length needs to be at least 8 char"
fi

MATRIX="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

MATRIXS=".#-+"
s=1

while [ "${s:=1}" -le "2" ]
do
    PASSS="$PASSS${MATRIXS:$(($RANDOM%${#MATRIXS})):1}"
    let s+=1
done


while [ "${n:=1}" -le "$((${LENGTH}-2))" ]
do
    PASS="$PASS${MATRIX:$(($RANDOM%${#MATRIX})):1}"
    let n+=1

	#add special character as 3rd and 4th
	if [ "$n" = "3" ]; then
	    PASS=${PASS}${PASSS}
	fi

done
echo "$PASS"
