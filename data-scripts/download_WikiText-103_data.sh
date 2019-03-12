#!/bin/bash
# Downloads the English data for the E-c subtask to a new subfolder in the current working directory
# This subtask is described in SemEval-2018 Task 1: Affect in Tweets 
# Link to data webpage: https://blog.einstein.ai/the-wikitext-long-term-dependency-language-modeling-dataset/

git_root_dir="$(git rev-parse --show-toplevel)"
target_dir="$git_root_dir/data"
echo "Will download data to '$target_dir'."

if [ ! -d "$target_dir" ]; then
    mkdir -p "$target_dir"
fi
cd "$target_dir" || exit 1

wget https://s3.amazonaws.com/research.metamind.io/wikitext/wikitext-103-v1.zip -O wikitext.zip
unzip wikitext.zip && rm wikitext.zip
chmod a-w wikitext-103/*.tokens
echo "Finished."
pwd

