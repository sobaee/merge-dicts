# merge-dicts

This is a bash script to automatically merge multiple tabfile dictionaries (with .txt extension) and other .txt files; may not work properly with other dictionaries, so if you need to merge two or more dictionaries, convert each one of them using pyglossary to .txt tabfile then merge them.

The script will optionally convert the merged .txt file to .mtxt (octopus source), and pack it to .mdx dictionary.

DEPENDENCIES:

Pyglossary, mdict-utils, python-lzo


USAGE:

- Navigate to the directory that contains the dictionary files and this bash file and run the command: bash merge-dicts.sh

- Before merging, the script will ask you if you want to sort the files (file1 then file2, etc).

- After merging, the script will ask you if you want to sort Headwords with Pyglossary before conversion to mtxt (ex. english then arabic headwords), and then will ask you if you want to convert the resulted .mtxt file to .mdx.

N.B: the script will ask you to merge 4 txt files, but if you have less files to merge, just ignore them by "enter" without writing any input.


Thanks to the owners of Pyglossary and mdict-utils

Download this modified version of Pyglossary, with octopus_mdict_source.py added and setup.py fixed, so after decompression of this zip file,  you can do: "python setup.py install" to install pyglossay and it will work perfectly:
https://drive.google.com/open?id=1foGOqZGtbVgG65zlEk2hXMPXKSQyNuIX
