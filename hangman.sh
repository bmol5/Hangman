#!/bin/bash
#Resources Used:
#1. https://stackoverflow.com/questions/21157435/how-can-i-compare-a-string-to-multiple-correct-values-in-bash

echo "Would you like to play hangman?"
read response
word=cat

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
echo " "
read -a guess
list=$(echo "Letters used: ${guess}")
i=$((i-1))
echo -e "$i attemps remaining\n"

if [[ $guess == $fl ]];
then
echo "${list}"
echo "$fl _ _"
elif [[ $guess == $sl ]];
then
echo "${list}"
echo "_ $sl _"
elif [[ $guess == $tl ]];
then
echo "${list}"
echo "_ _ $tl"
elif [[ $guess != $fl || $sl || $tl  ]];
then
echo "${list}"
fi

echo " "
read -a guess2
list+="$guess2"
i=$((i-1))
echo "$i attempts remaining"

if [[ $guess2 == "$fl" && $guess == "$tl" ]] || [[ $guess2 == "$tl" && $guess == "$fl" ]];
then
echo "$fl _ $tl"
echo "${list}"
elif [[ $guess2 == "$fl" && $guess == "$sl" ]] || [[ $guess2 == "$sl" && $guess == "$fl" ]];
then
echo "$fl $sl _"
echo "${list}"
elif [[ $guess2 = "$fl" ]] && [[ $guess != "$fl" || "$sl" || "$tl" ]];
then
echo "$fl _ _"
echo "${list}"
elif [[ $guess2 == "$sl" ]] && [[ $guess != "$fl" || "$sl" || "$tl" ]];
then
echo "_ $sl _"
echo "${list}"
elif [[ $guess2 == "$tl" ]] && [[ $guess != "$fl" || "$sl" || "$tl" ]];
then
echo "_ _ $tl"
echo "${list}"
elif [[ $guess2 != $firstletter || $secondletter || $thirdletter  ]];
then
echo "${list}"
fi


done

if [[ $i = 1 ]];
then
exit
fi
