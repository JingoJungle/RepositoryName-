#!/bin/bash


str="$1" 
IFS='/' 
while true; do
echo "$str"

read -ra ADDR <<< "$str"
str="${ADDR[4]}"
IFS='.'
read -ra ADDR2 <<< "$str"
echo "${ADDR2[0]}"
if [ "${ADDR2[1]}" != 'git' ];
then
	echo Not a git link!
	echo Enter a link:
	read str
else
	direct="${ADDR2[0]}"
	git clone "$1"
	cd "$direct"
	IFS=' '
	return
fi
done
