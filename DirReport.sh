#!/bin/bash

# Task 1 Ask for a directory 
read -p "Please enter the directory path:" path

# Task 2 List all the content of the directory 
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
ls -al "$path" > "${path}/directory_report.txt"

# task 3 List content including file name, size, last modification date
echo "Detailed content will be added..."
ls -alF --time-style=long-iso "$path" >> "$path/directory_report.txt"
echo "Script execution was completed, for more details check the log file generated"


