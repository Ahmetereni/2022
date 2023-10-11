#!/bin/sh


parsetxt="input.txt" # Set the input file name

# Check if the input file exists
if [ ! -f "$parsetxt" ]; then
  echo "File '$parsetxt' does not exist."
  echo "Lutfen metin(txt) dosyasinin adini input olarak degitirip programi calistirin."
  echo "kapatmak icin herhangi bir tusa basin"
  read -r
  exit 1
fi

# Create the 'asinler' folder if it doesn't exist
mkdir -p asinler

# Count the total number of lines in the input file
total_lines=$(wc -l < "$parsetxt")

# Calculate the number of parts needed to have exactly 10,000 lines in each part
element=10000
parts=$((total_lines / element))

# Split the file into smaller files with exactly 10,000 lines each and place them in the 'asinler' folder
split -l "$element" "$parsetxt" "asinler/$parsetxt.part"

# Rename the split files with a numeric sequence and '.txt' extension
count=1
for FILE in asinler/"$parsetxt.part"*; do
  mv "$FILE" asinler/"$count.txt"
  count=$((count+1))
done

echo "Splitting and renaming completed. Output files are in the 'asinler' folder."
