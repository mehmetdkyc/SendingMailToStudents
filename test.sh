#! /bin/bash
# filename=$1
# while read gecici
# do
#     echo "Read line in wihle loop: $gecici"
# done < $filename
# exit 0;

zenity --info --width 300 --text "This program translates your file in english or turkish. Click OK to continue."

filename=$(zenity --entry --text "Please enter your filename:" --title "Translate" --entry-text=""); echo $filename 

a=$(zenity --title "Language" --text "Select the language you want to translate" --list --radiolist --column "Choice" --column "Language" True ENG False TR ); echo $a

if [ "$a" == "ENG" ]
then   
    trans file://$filename | trans -b -o "${filename%.*}"_copy.txt :en 
elif [ "$a" == "TR" ]
then
    trans file://$filename | trans -b -o "${filename%.*}"_copy.txt :en 
else
    zenity --error --width 300 --text "Opps! Something went wrong. Please try again later."
fi;

cat $filename >> "${filename%.*}"_copy.txt

senduser=$(zenity --entry --text "Please enter user to send your mail." --title "Translate" --entry-text=""); echo $senduser

swaks --to $senduser -s smtp.gmail.com:587 -tls -au denemehesabi3765@gmail.com -ap deneme1234  --attach  -d "${filename%.*}"_copy.txt


