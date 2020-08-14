#!/bin/bash -x

declare -A dictionary;

minimum=11
maximum=-1

function getDieNumber
{
	checkDie=$((RANDOM%6 + 1))
	storeInDictionary $checkDie
}

function storeInDictionary
{
	key=$1
	dictionary[$key]=$(( ${dictionary[$key]} + 1 ))
}

function getMinMax
{
	for ((i=1; i<=${#dictionary[@]}; i++))
	do
		if [ ${dictionary[$i]} -lt $minimum ]
		then
			minimum=${dictionary[$i]}
		fi
		if [ ${dictionary[$i]} -gt $maximum ]
		then
			maximum=${dictionary[$i]}
		fi
	done
}

function rollDieMain
{
	while [[ ${dictionary[1]} -ne 10 && ${dictionary[2]} -ne 10 && ${dictionary[3]} -ne 10 && ${dictionary[4]} -ne 10 && ${dictionary[5]} -ne 10 && ${dictionary[6]} -ne 10 ]]
	do
		getDieNumber
	done
	getMinMax
}
rollDieMain

echo "Die Values :" ${!dictionary[@]}
echo "Count : " ${dictionary[@]}
echo "Minimum Value :" $minimum
echo "Maximum value :" $maximum



