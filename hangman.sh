#!/bin/bash
#Resources Used:
#1. https://stackoverflow.com/questions/21157435/how-can-i-compare-a-string-to-multiple-correct-values-in-bash

echo "Would you like to play hangman?"
read response
word=hat

if [ $response=="yes" ];
then
sleep 1s
echo "============================================================ "
echo "You will have 6 total attempts to guess the word. Good luck!"
fl=$(echo $word | cut -b 1)
sl=$(echo $word | cut -b 2)
tl=$(echo $word | cut -b 3)
fi

i=6

while [ $i -gt 0 ];
do
echo "."
read guess
list=$(echo "Letters used: ")
i=$((i-1))
echo $list
echo " "
echo "$i attemps remaining"

if [[ $guess == $fl ]];
then
echo "h__"
elif [[ $guess == $sl ]];
then
echo "_a_"
elif [[ $guess == $tl ]];
then
echo "__t"
elif [[ $guess != $fl || $sl || $tl  ]];
then
list+="$guess"
fi

echo ".."
read guess2
i=$((i-1))
echo "$i attempts remaining"

if [[ $guess2 == "$fl" && $guess == "$tl" ]] || [[ $guess2 == "$tl" && $guess == "$fl" ]];
then
echo "$fl _ $tl"
elif [[ $guess2 == "$fl" && $guess == "$sl" ]] || [[ $guess2 == "$sl" && $guess == "$fl" ]];
then
echo "$fl $sl _"
elif [[ $guess2 = "$fl" ]] && [[ $guess != "$fl" || "$sl" || "$tl" ]];
then
echo "$fl _ _"
echo "Letters attempted: $guess"
elif [[ $guess2 == "$sl" ]] && [[ $guess != "$fl" || "$sl" || "$tl" ]];
then
echo "_ $sl _"
echo "Letters attempted: $guess"
elif [[ $guess2 == "$tl" ]] && [[ $guess != "$fl" || "$sl" || "$tl" ]];
then
echo "_ _ $tl"
echo "Letters attempted: $guess"
elif [[ $guess2 != $firstletter || $secondletter || $thirdletter  ]];
then
list+="$guess2"
fi


done

if [[ $i = 1 ]];
then
exit
fi
