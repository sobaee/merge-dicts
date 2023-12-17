# merge-dicts

This is a bash script to automatically merge multiple tabfile dictionaries (with .txt extension) and other .txt files; may not work properly with other dictionaries.

The script will optionally convert the merged .txt file to .mtxt (octopus source), and pack it .mdx dictionary.

DEPENDENCIES:

Pyglossary, mdict-utils, python-lzo


USAGE:

- Navigate to the directory that contains the dictionary files and this bash file and run the command: bash merge-dicts.sh

- Before merging, the script will ask you if you want to sort the files (file1 then file2, etc).

- After merging, the script will ask you if you want to sort Headwords with Pyglossary before conversion to mtxt (ex. english then arabic headwords), and then will ask you if you want to convert the resulted .mtxt file to .mdx.

N.B: the script will ask you to merge 4 txt files, but if you have less files to merge, just ignore them by "enter" without writing any input.


Theanks to the owners of Pyglossary and mdict-utils
