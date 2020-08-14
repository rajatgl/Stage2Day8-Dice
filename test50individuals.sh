#!/bin/bash -x

declare -A birthDictionary
getBirthYear ()
{
	birthYear=$((RANDOM%2 + 92))
}

getBirthMonth ()
{
	birthMonth=$((RANDOM%12 + 1))
}

storeInDictionary ()
{
	value="$1-$2-'Person #$3'"
	birthDictionary[$1]="${birthDictionary[$1]} $value"
}

printBirthMonth ()
{
	for (( i=1; i<=12; i++ ))
	do
		echo ${birthDictionary[$i]}
	done
}

birthMonthMain ()
{
	person=0
	while [ $person -ne 50 ]
	do
		getBirthYear
		getBirthMonth
		storeInDictionary $birthMonth $birthYear $person
		((person++))
	done
	printBirthMonth
}
birthMonthMain
