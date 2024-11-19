##!/bin/bash

echo "Enter you age:"
read age

if [ $age -ge 18 ];
then
	echo "You are adult"
elif [ $age -ge 13 ];
then
	echo "you are A Teenager"
else
	echo "you aren't adult"
fi

