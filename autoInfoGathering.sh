#!/bin/bash
echo "Enter Host:"
read host
echo "$host Selected"
echo "Enter path for web content fuzzing list... example: /home/user/SecLists/Discovery/Web-Content/raft-medium-directories.txt..."
read path
echo "Selected path: "$path"" 
echo "Scanning host, please wait..."
nmap -sV -Pn -A -T 4 "$host"
whatweb "$host"
echo "----------------------------------------------------------------------------------------------------------"
echo "If needed, add the host to /etc/hosts before the next step and run the script again with the host name..."
echo "----------------------------------------------------------------------------------------------------------"
echo "Content Discovery In Progress..."
wfuzz -c -z file,"$path" --hc 404,403,301,503 http://"$host"/FUZZ
echo "----------------------------------------------------------------------------------------------------------"
echo "Nikto Vulnerability Scan In Progress..."
nikto +host "$host"
echo "Finished!"
