#!/usr/bin/env python3
# Dependencies:
# python3, pyglossary, mdict-utils, which
# 
# Install all dependencies with:
# pip3 install mdict-utils python-lzo
# pyglossary better to be installed from a local folder with: python setup.py install (better to use my ready pyglossary zip file)
#
# Import the modules
import os
import sys
import subprocess

def command_exists(command):
    # Check if a command exists in the system
    return subprocess.call(['which', command], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL) == 0

if command_exists('python3'):
    print('Python3 is ready!')
else:
    print("ERROR: python not installed! Download and install from https://www.python.org/downloads")
    sys.exit(1)

if command_exists('pyglossary'):
    print('Pyglossary is ready!')
else:
    print("ERROR: pyglossary not installed! Run 'pip3 install pyglossary'")
    sys.exit(1)

if command_exists('mdict'):
    print('Mdict-utils is ready!')
else:
    print("ERROR: mdict not found! Run 'pip3 install mdict-utils'!")
    sys.exit(1)

# Ask the user for the file names
num_files = int(input("How many .txt files do you want to merge? "))
output_files = []
for i in range(num_files):
    file = input("{} file name: ".format(i+1))
    output_files.append(file)

output = input("Output file name: ")
choice = input("Do you want to sort the files (SLOW if the files are big)? (y/n): ")

if choice.lower() == 'y':  # Sort the files
    subprocess.run(["cat"] + output_files + ["|", "sort", ">", output], shell=True)
elif choice.lower() == 'n':  # Do not sort the files
    subprocess.run(["cat"] + output_files + [">", output], shell=True)
else:  # Invalid choice
    print("Invalid option. Please enter y or n.")

src = output

answer = input("Do you want to convert the merged file to .mtxt (with optional headwords sorting)? (y/n) ")
if answer.lower() == 'y':  # Use Word Title option
    print("Your file will be converted to .mtxt!")
elif answer.lower() == 'n':  # Do not use Word Title option
    print("Thank you for using my tool!")
    exit(1)
else:  # Invalid choice
    print("Invalid option. Please enter y or n.")

choice1 = input("Do you want to sort headwords before conversion to mtxt (ex. english then arabic headwords)? (y/n): ")

sort_key = ""
if choice1.lower() == 'y':  # Sort the files
    sort_key = input("Enter the sorting key (e.g. en-ar, ar-en, en, ar) or press enter to use the default (en-ar): ")
    if not sort_key:
        sort_key = "en-ar"
    subprocess.run(["pyglossary", src, "{}.mtxt".format(src[:-4]), "--write-format=OctopusMdictSource", "--sort", "--sort-key=:" + sort_key], shell=True)

    with open("description.html", "w") as file:
        file.write(src[:-4])
    with open("title.html", "w") as file:
        file.write(src[:-4])

    print('Pyglossary sorting and conversion to mtxt done!')
elif choice1.lower() == 'n':  # Do not sort the files
    subprocess.run(["pyglossary", src, "{}.mtxt".format(src[:-4]), "--write-format=OctopusMdictSource"], shell=True)
    print('Conversion to mtxt done without sorting!')
else:  # Invalid choice
    print("Invalid option. Please enter y or n.")

choice2 = input("Convert the resulted .mtxt file to mdx? (y/n): ")

if choice2.lower() == 'y':  # Convert to mdx
    subprocess.run(["mdict", "--title", "title.html", "--description", "description.html", "-a", "{}.mtxt".format(src[:-4]), "{}.mdx".format(src[:-4])], shell=True)
    print('All done!')
elif choice2.lower() == 'n':  # Do not convert to mdx
    print('All done!')
else:  # Invalid choice
    print("Invalid option. Please enter y or n.")

print('Thank you for using my tool!')
