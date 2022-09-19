#!/bin/bash
#by suliangliang on 2022-08-07
#Remark:
Str="Learn Bash Commands from UbuntuPit"
#subStr=${Str:0:20}
subStr=$(echo $Str | cut -d ' ' -f 1-3)
echo $subStr

string1="Ubuntu"
string2="Pit"
string=$string1$string2
echo "$string is a great resource for Linux beginners."
