#!/bin/bash

while getopts "u:" arg; do
  case $arg in
    u) site=$OPTARG;;
  esac
done
echo
echo 'snapchat : aaa.saq       Twitter : r00t_nasser'
echo
nmap -sT -T4 --top-ports 200 $site >> log/network.txt
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


gobuster dir -u $site -t 50 -w list.txt -l -e -x php,rar,zip,gz,asp,apsx 2>/dev/null | grep = |  cut -d ' ' -f1 > log/path.txt 

echo '[+] Path Discoviry Done '
echo
