#!/bin/bash

NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
clear


ipv6aku=$(ip addr show eth0 | grep "inet6\b" | awk '{print $2}' | cut -d/ -f1)
ipv4aku=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
ipaku=$(wget -qO- ipecho.net/plain)
hostall=$(hostname --all-ip-addresses | awk '{print $0}')
host1=$(hostname --all-ip-addresses | awk '{print $1}')
host2=$(hostname --all-ip-addresses | awk '{print $2}')
host3=$(hostname --all-ip-addresses | awk '{print $2}')
host4=$(hostname --all-ip-addresses | awk '{print $2}')
ipcidr=$(ip -4 -o addr show eth0 | awk '{print $4}')
slporttcp=sudo lsof -nP -iTCP -sTCP:LISTEN
slportudp=sudo lsof -iUDP -P -n | egrep -v '(127|::1)'


echo -e ""
echo -e "${BB}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[44;1;39m              ⇱ TCP UDP Information ⇲             \E[0m"
echo -e "${BB}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YB}⇲ PORT TCP${NC}    : $slporttcp"
echo -e "${YB}⇲ PORT UDP${NC}    : $slportudp"
echo -e "${BB}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[44;1;39m              ⇱ Alamat IP Information ⇲             \E[0m"
echo -e "${BB}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YB}⇲ Alamat IPv6 Internal${NC}            : ${WB}$ipv6aku${NC}"
echo -e "${YB}⇲ Alamat IPv4 Internal/Private${NC}    : ${WB}$ipv4aku${NC}"
echo -e "${YB}⇲ Alamat IPv4 Eksternal/Private${NC}   : ${WB}$ipaku${NC}"
echo -e "${BB}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[44;1;39m              ⇱ Host Information ⇲             \E[0m"
echo -e "${BB}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YB}⇲ Host 0 ${NC}    : ${WB}$host0 ${NC}"
echo -e "${YB}⇲ Host 1 ${NC}    : ${WB}$host1 ${NC}"
echo -e "${YB}⇲ Host 2 ${NC}    : ${WB}$host2 ${NC}"
echo -e "${YB}⇲ Host 3 ${NC}    : ${WB}$host3 ${NC}"
echo -e "${YB}⇲ Host 4 ${NC}    : ${WB}$host4 ${NC}"
echo -e "${YB}⇲ IP CIDR ${NC}   : ${WB}$ipcidr ${NC}"
echo -e "${BB}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""