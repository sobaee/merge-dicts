#!/bin/bash
# 
# Dependencies:
# python3, pyglossary, mdict-utils, which
# 
# Install all dependencies with:
# pip3 install mdict-utils python-lzo
# pyglossary better to be installed from a local folder with: python setup.py install (better to use my ready pyglossary zip file)
if command -v python3; then
    echo 'Python3 is ready!'
else
    echo "ERROR: python not installed! Download and install from https://www.python.org/downloads"
    exit 1
fi

if command -v pyglossary; then
    echo 'Pyglossary is ready!'
else
    echo "ERROR: pyglossary not installed! Run 'pip3 install pyglossary'"
    exit 1
fi

if command -v mdict; then
    echo 'Mdict-utils is ready!'
else
    echo "ERROR: mdict not found! Run 'pip3 install mdict-utils'!"
    exit 1
fi

read -p "How many .txt files do you want to merge? " num_files
num_files=$((num_files))

output_files=()
for ((i=1; i<=num_files; i++))
do
    read -p "$i file name: " file
    output_files+=("$file")
done

read -p "Output file name: " output
read -p "Do you want to sort the files (SLOW if the files are big)? (y/n): " choice

# Use the files in the cat command
case $choice in
    y|Y) # Sort the files
        cat "${output_files[@]}" | sort > "$output"
        ;;
    n|N) # Do not sort the files
        cat "${output_files[@]}" > "$output"
        ;;
    *) # Invalid choice
        echo "Invalid option. Please enter y or n."
        ;;
esac

src="$output"

read -p "Do you want to convert the merged file to .mtxt (with optional headwords sorting)? (y/n) " answer
    case $answer in
    y|Y) # Use Word Title option
    
        echo 'Your file will be converted to .mtxt!'
        ;;
    n|N) # Do not use Word Title option
       echo 'Thank you for using my tool!'
       exit 1
       
        ;;
    *) # Invalid choice
        echo "Invalid option. Please enter y or n."
        ;;
esac

read -p "Do you want to sort headwords before conversion to mtxt (ex. english then arabic headwords)? (y/n): " choice1

case $choice1 in
    y|Y) # Sort the files
        # Ask the user to input the sorting key
        read -p "Enter the sorting key (e.g. en-ar, ar-en, en, ar) or press enter to use the default (en-ar): " sort_key
        # If the user did not enter anything, use the default key
        if [ -z "$sort_key" ]; then
            sort_key="en-ar"
        fi
        # Use the sorting key in the Pyglossary command
        pyglossary "$src" "${src%.*}.mtxt" --write-format=OctopusMdictSource --sort --sort-key=":$sort_key"

        printf ${src%.*} > description.html
        printf ${src%.*} > title.html

        echo 'Pyglossary sorting and conversion to mtxt done!'
        ;;
    n|N) # Do not sort the files
        
        pyglossary "$src" "${src%.*}.mtxt" --write-format=OctopusMdictSource
        echo 'Conversion to mtxt done without sorting!'
        ;;
    *) # Invalid choice
        echo "Invalid option. Please enter y or n."
        ;;
esac

read -p "Convert the resulted .mtxt file to mdx? (y/n): " choice2

src="$output"
case $choice2 in
    y|Y) # Convert to mdx
        mdict --title title.html --description description.html -a "${src%.*}.mtxt" "${src%.*}.mdx"
        echo 'All done!'
        ;;
    n|N) # Do not convert to mdx
        echo 'All done!'
        ;;
    *) # Invalid choice
        echo "Invalid option. Please enter y or n."
        ;;
esac

echo 'Thank you for using my tool!'