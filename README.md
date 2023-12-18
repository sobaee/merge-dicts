# merge-dicts

This is a bash script (and a similar python script) to automatically merge multiple tabfile dictionaries (with .txt extension) and other .txt files; note that this script may not work properly with other dictionaries, so if you need to merge any number of dictionaries, convert each one of them using pyglossary to .txt tabfile then merge them.

The script will ask you to define the number of the files that you want merge, then optionally convert the merged .txt file to .mtxt (octopus mdict source), and then pack it to .mdx dictionary.

<br />
<br />

## DEPENDENCIES:

Pyglossary, mdict-utils, python-lzo, which

<br />
<br />
## USAGE:

- Navigate to the directory that contains this bash script (or python script) and copy the dictionary files to the same directory, and  run the command: `bash merge-dicts.sh`

- Before merging, the script will ask you if you want to sort the files (file1 then file2, etc) or not.

- After merging, the script will ask you if you want to convert the resulted file to .mtxt and sort headwords (ex. english then arabic headwords) or not, and finally will ask you if you want to convert the resulted .mtxt file to .mdx.


Thanks to the owners of Pyglossary and mdict-utils.

Download this modified version of Pyglossary, with octopus_mdict_source.py added and setup.py fixed, so after decompression of this zip file,  you can do: `ython setup.py install` to install pyglossay and it will work perfectly: [LINK](https://drive.google.com/open?id=1foGOqZGtbVgG65zlEk2hXMPXKSQyNuIX)
