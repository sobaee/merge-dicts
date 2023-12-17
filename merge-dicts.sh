#!/bin/bash

read -p "1st file name: " file1
read -p "2nd file name: " file2
read -p "3rd file name: " file3
read -p "4th file name: " file4
read -p "Output file name: " output
read -p "Do you want to sort the files (SLOW if the files are big)? (y/n): " choice

# Use the files in the cat command
case $choice in
    y|Y) # Sort the files
        cat "$file1" "$file2" "$file3" "$file4" | sort > "$output"
        ;;
    n|N) # Do not sort the files
        cat "$file1" "$file2" "$file3" "$file4" > "$output"
        ;;
    *) # Invalid choice
        echo "Invalid option. Please enter y or n."
        ;;
esac

src="$output"

read -p "Do you want to continue with the next step to convert the merged file to .mtxt with Headword sorting? (y/n) " answer
    case $answer in
    y|Y) # Use Word Title option
    
        echo 'You chose to continue!'
        ;;
    n|N) # Do not use Word Title option
       echo 'Thank you for using my tool!'
       exit 1
       
        ;;
    *) # Invalid choice
        echo "Invalid option. Please enter y or n."
        ;;
esac

read -p "Sort Headwords with Pyglossary before conversion to mtxt (ex. english then arabic headwords)? (y/n): " choice1

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
    y|Y) # Sort the files

mdict --title title.html --description description.html -a "${src%.*}.mtxt" "${src%.*}.mdx"

echo 'All done!'
        ;;
    n|N) # Do not sort the files
        echo 'All done!'
        ;;
    *) # Invalid choice
        echo "Invalid option. Please enter y or n."
        ;;
esac
echo 'Thank you for using my tool'