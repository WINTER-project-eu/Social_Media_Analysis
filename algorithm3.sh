#!/bin/bash

SEARCH_FOLDER=path_to_folder
KEYWORDS='singlekeywords.txt'
while IFS= read -r line; 
do 
	#echo $line
	SEARCH_WORD=$line
	echo $SEARCH_WORD 
	WORD_OUTPOUT=$(echo $SEARCH_WORD | head -n1 | cut -d " " -f1)
	#echo $WORD_OUTPOUT
	for filename in $(find "$SEARCH_FOLDER" -type f -name '*sentences.txt');
	do 	
		folder=${filename::-31}
		cd $folder
    	grep -i "$SEARCH_WORD" $filename >> $WORD_OUTPOUT.txt
    	grep -i "$SEARCH_WORD" $filename | wc -l
    	cd ..
    	echo $filename;

	done;
done < "$KEYWORDS"
