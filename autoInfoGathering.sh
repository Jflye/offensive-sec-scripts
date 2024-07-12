#!/bin/bash
Green='\033[0;32m'
NC='\033[0m'
R='\033[0;31m'

echo -e "${Green}Enter Host:${NC}"
read host
echo -e "${Green} $host Selected!${NC}"
echo -e "${GREEN}Enter path for web content fuzzing list...${NC}"
read path
echo -e "${Green}Selected path:${NC} "$path""

echo -e "${Green}Scanning host, please wait...${NC}"
nmap -sV -Pn -A -T 4 "$host"
whatweb "$host"
echo "----------------------------------------------------------------------------------------------------------"
echo -e "${R}If needed, add the host to /etc/hosts before the next step and run the script again with the hostname...${NC}"
echo "----------------------------------------------------------------------------------------------------------"

echo -e "${Green}Content Discovery In Progress...${NC}"
wfuzz -c -z file,"$path" --hc 404,403,301,503 http://"$host"/FUZZ
echo "----------------------------------------------------------------------------------------------------------"

echo -e "${Green}Nikto Vulnerability Scan In Progress...${NC}"
nikto +host "$host"
echo -e "${Green}Finished!${NC}"
