#!/bin/bash
echo "Word Extractor"
echo "Write a Paragraph or Set of Lines"
echo "Word Limit: 200 Words"

#file="trial.txt"
read -p "Enter a Paragraph: " -r paragraph
read -p "Enter a Word that You Want to Extract: " -r search_word

if [[ -z "$search_word" ]]; then
    echo "Error: Search word cannot be empty."
    exit 1
fi
matches=$(echo "$paragraph" | grep -o -w "$search_word" | wc -l)


if [ "$matches" -eq 0 ]; then
    echo "'$search_word' not found."
    exit 0
fi

echo "Found $matches occurrence(s) of '$search_word'."
read -p "Replace the Word? (y/n): " choice

if [[ "$choice" == "y" ]]; then
    read -p "Enter replacement word: " replace_word

    new_paragraph=$(echo "$paragraph" | sed "s/$search_word/$replace_word/g")

    echo "Word replaced."
    echo "Updated paragraph:"
    echo "$new_paragraph"
fi
