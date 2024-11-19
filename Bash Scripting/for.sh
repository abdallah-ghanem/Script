#!/bin/bash
echo "Enter 3 names"
names=()

for var in 1 2 3 ;
do
	read name
	names+=("$name")
done

for name in "${names[@]}";
do
	echo "Hola $name"
done
