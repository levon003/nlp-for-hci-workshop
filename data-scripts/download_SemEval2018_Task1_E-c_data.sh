#!/bin/bash
# Downloads the English data for the E-c subtask to a new subfolder in the current working directory
# This subtask is described in SemEval-2018 Task 1: Affect in Tweets 
# Link to competition details and data: https://competitions.codalab.org/competitions/17751

git_root_dir="$(git rev-parse --show-toplevel)"
target_dir="$git_root_dir/data/SemEval2018-Task1/E-c"
echo "Will download data to '$target_dir'."

if [ ! -d "$target_dir" ]; then
    mkdir -p "$target_dir"
fi
cd "$target_dir" || exit 1
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

