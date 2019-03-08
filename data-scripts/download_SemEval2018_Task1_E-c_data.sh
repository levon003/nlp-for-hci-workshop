#!/bin/bash
# Downloads the English data for the E-c subtask to a new subfolder in the current working directory
# This subtask is described in SemEval-2018 Task 1: Affect in Tweets 
# Link to competition details and data: https://competitions.codalab.org/competitions/17751

if [ ! -d E-c ]; then
    mkdir E-c
fi
cd E-c
wget http://saifmohammad.com/WebDocs/AIT-2018/AIT2018-DATA/E-c/English/2018-E-c-En-train.zip -O ecTrain.zip
wget http://saifmohammad.com/WebDocs/AIT-2018/AIT2018-DATA/E-c/English/2018-E-c-En-dev.zip -O ecDev.zip
wget http://saifmohammad.com/WebDocs/SemEval2018-Task1-AIT-Test-gold.zip -O ecTest.zip
unzip ecTrain.zip
unzip ecDev.zip
unzip -p ecTest.zip SemEval2018-Task1-AIT-Test-gold/E-c/2018-E-c-En-test-gold.txt > 2018-E-c-En-test-gold.txt
rm ecTrain.zip ecDev.zip ecTest.zip
chmod a-w *.txt
echo "Finished."
pwd

