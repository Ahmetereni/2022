#!/bin/sh

echo "Enter the name of the text file to parse (including the file extension):"
read parsetxt

echo "How many lines should be in one piece?"
read element

# Check if the input file exists
if [ ! -f "$parsetxt" ]; then
  echo "File '$parsetxt' does not exist."
  exit 1
fi

# Create the 'output' folder if it doesn't exist
mkdir -p output

# Split the file into smaller files and place them in the 'output' folder
split -l "$element" "$parsetxt" "output/$parsetxt.part"

# Rename the split files with a numeric sequence and '.txt' extension
count=1
for FILE in output/"$parsetxt.part"*; do
  mv "$FILE" output/"$count.txt"
  count=$((count+1))
done

echo "Splitting and renaming completed. Output files are in the 'output' folder."
