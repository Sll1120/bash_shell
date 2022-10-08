#!/bin/bash
echo -n "Enther number:"
read num
if [[ ($num -lt 10) && ($num%2 -eq 0) ]]
then
	echo -e "even number\n"
else
	echo -e "odd number\n"
fi
