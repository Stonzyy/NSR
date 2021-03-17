#!/bin/bash

while getopts "u:" arg; do
  case $arg in
    u) site=$OPTARG;;
  esac
done

nmap -A -sT -T4 $site >> log/network.txt
echo 
echo '[+] Network Discoviry Done'
echo
subfinder -d $site -silent > log/subs.txt 
cat log/subs.txt | httprobe > log/vaild_subs.txt
echo '[+] Subdomains Discoviry Done ' 
echo
echo $site | waybackurls > log/wayback.txt


echo '[+] Wayback Discoviry Done '
echo

cat log/wayback.txt | grep = > log/params.txt

echo '[+] Parametr Discoviry Done '
echo 


gobuster dir -u $site -t 50 -w list.txt -l -e -x php,rar,zip,gz,asp,apsx 2>/dev/null > log/path.txt