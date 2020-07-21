cat header.csv > target_file.csv
cat file1.csv >> target_file.csv
cat file2.csv >> target_file.csv
sed -i "s/?/2018101024/" target_file.csv
