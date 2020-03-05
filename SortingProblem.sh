#!/bin/bash -x

#Problem Statement : Sorting Arithmetic Computation Problem
#Discription : This solution computes diff arithmetic expr and sorts the results
#Author : Kunal Jadhav
#Date : 5 March 2020

function AcceptValues() {
	read -p "Enter the values of a,b and c: " a b c
	if [[ $a -eq null || $b -eq null || $c -eq null ]]
	then
		echo "You should enter each value a , b and c "
		AcceptValues
	fi
}
AcceptValues

operation1=$(($a+$b*$c))
operation2=$(($a*$b+$c))
