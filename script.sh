#!/bin/sh

echo enter a txt to parse:
read parsetxt
#echo how many element in one piece? 
#read element

element=10000
split -l $element -e $parsetxt.txt && rm $parsetxt.txt
for FILE in *; do cat $FILE>$FILE.txt; done