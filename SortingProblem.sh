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

declare -A results
results[operation1]=`expr "scale=2;$a+$b*$c" | bc -l`
results[operation2]=`expr "scale=2;$a*$b+$c" | bc -l`
results[operation3]=`expr "scale=2;$c+$a/$b" | bc -l`
results[operation4]=`expr "scale=2;$a%$b+$c" | bc -l`

declare -a resultsArray
counter=0
resultsArray[((counter++))]=${results[operation1]}
resultsArray[((counter++))]=${results[operation2]}
resultsArray[((counter++))]=${results[operation3]}
resultsArray[((counter++))]=${results[operation4]}

echo "Displaying array elements ${resultsArray[@]}"

function DescendingSort(){
for ((i=0; i<4; i++))
do
	temp=0
	for ((j=0; j<4; j++))
	do
		if [[ ${resultsArray[$j]%.*} -lt ${resultsArray[$i]%.*} ]]
		then
			temp=${resultsArray[$i]}
			resultsArray[$i]=${resultsArray[$j]}
			resultsArray[$j]=$temp

		fi
	done
done
echo "Displaying in Descending order ${resultsArray[@]}"
}

DescendingSort

function AscendingSort(){
for ((i=0; i<4; i++))
do
   temp=0
   for ((j=0; j<4; j++))
   do
      if [[ ${resultsArray[$j]%.*} -gt ${resultsArray[$i]%.*} ]]
      then
         temp=${resultsArray[$i]}
         resultsArray[$i]=${resultsArray[$j]}
         resultsArray[$j]=$temp

      fi
   done
done
echo "Displaying in Ascending order ${resultsArray[@]}"
}

AscendingSort
