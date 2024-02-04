#!/bin/bash
clear
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray_service == "running" ]]; then
status_xray="${GB}[ ON ]${NC}"
else
status_xray="${RB}[ OFF ]${NC}"
fi
if [[ $nginx_service == "running" ]]; then
status_nginx="${GB}[ ON ]${NC}"
else
status_nginx="${RB}[ OFF ]${NC}"
fi
dtoday="$(vnstat | grep today | awk '{print $2" "substr ($3, 1, 3)}')"
utoday="$(vnstat | grep today | awk '{print $5" "substr ($6, 1, 3)}')"
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}')"
dmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $2" "substr ($3, 1 ,3)}')"
umon="$(vnstat -m | grep `date +%G-%m` | awk '{print $5" "substr ($6, 1 ,3)}')"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}')"
domain=$(cat /etc/xray/domain)
ISP=$(cat /etc/xray/org)
CITY=$(curl -s ipinfo.io/city)
WKT=$(cat /etc/timezone)
DATE=$(date -R | cut -d " " -f -4)
MYIP=$(curl -sS ipinfo.io/ip)
REGION=$( curl -s ipinfo.io/region )
# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
clear
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "               ${WB}----- [ D-Zeyn Script ] -----${NC}              "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${YB}Service Provider${NC} ${WB}: $ISP${NC}"
echo -e " ${YB}OS Name${NC}          ${WB}: $Tipe${NC}"
echo -e " ${YB}IP${NC}               ${WB}: $MYIP${NC}"
echo -e " ${YB}Timezone${NC}         ${WB}: $WKT${NC}"
echo -e " ${YB}City${NC}             ${WB}: $CITY${NC}"
echo -e " ${YB}Date${NC}             ${WB}: $DATE${NC}"
echo -e " ${YB}Domain${NC}           ${WB}: $domain${NC}"
echo -e " ${YB}Region${NC}           ${WB}: $REGION${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "     ${WB}NGINX STATUS :${NC} $status_nginx    ${WB}XRAY STATUS :${NC} $status_xray   "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "          ${WB}----- [ Bandwidth Monitoring ] -----${NC}"
echo -e ""
echo -e "  ${GB}Today ($DATE)     Monthly ($(date +%B/%Y))${NC}      "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "   ${YB}↓↓ Down${NC} : ${MB}$dtoday${NC}                     ${YB}↓↓ Down${NC} : ${MB}$dmon${NC}   "
echo -e "   ${YB}↑↑ Up${NC}   : ${MB}$utoday${NC}                     ${YB}↑↑ Up${NC}   : ${MB}$umon${NC}   "
echo -e "   ${YB}≈ Total${NC} : ${MB}$ttoday${NC}                     ${YB}≈ Total${NC} : ${MB}$tmon${NC}   "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ Menu Utama ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[1]${NC} ${YB}SSH & OpenVPN MENU${NC}           ${MB}[7]${NC} ${YB}SHADOWSOCKSR MENU ${NC}"
echo -e " ${MB}[2]${NC} ${YB}L2TP MENU${NC}                    ${MB}[8]${NC} ${YB}XRAY VMESS MENU${NC}"
echo -e " ${MB}[3]${NC} ${YB}PPTP MENU${NC}                    ${MB}[9]${NC} ${YB}XRAY VLESS MENU${NC}"
echo -e " ${MB}[4]${NC} ${YB}SSTP MENU${NC}                    ${MB}[10]${NC} ${YB}XRAY TROJAN MENU${NC}"
echo -e " ${MB}[5]${NC} ${YB}WIREGUARD MENU${NC}               ${MB}[11]${NC} ${YB}TROJAN GO MENU ${NC}"
echo -e " ${MB}[6]${NC} ${YB}SHADOWSOCKS MENU${NC}             ${MB}[12]${NC} ${YB}XRAY GRPC MENU ${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                 ${WB}----- [ Utility ] -----${NC}                "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[13]${NC} ${YB}SLOWDNS MENU (OFF)${NC}           ${MB}[18]${NC} ${YB}Settings ${NC}"
echo -e " ${MB}[14]${NC} ${YB}CEK SEMUA IP PORT${NC}            ${MB}[19]${NC} ${YB}Exit${NC}"
echo -e " ${MB}[15]${NC} ${YB}CEK SEMUA SERVICE VPN${NC}        ${MB}[20]${NC} ${YB}Copy Repo (Update}${NC}"
echo -e " ${MB}[16]${NC} ${YB}UPDATE MENU (2x)${NC}             ${MB}[21]${NC} ${YB}Menu info${NC}"
echo -e " ${MB}[17]${NC} ${YB}SL-FIX (Perbaiki Error SSLH+WS-TLS setelah reboot)${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e ""
read -p "Select From Options [ 1 - 21 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
l2tpmenu
;;
3)
clear
pptpmenu
;;
4)
clear
sstpmenu
;;
5)
clear
wgmenu
;;
6)
clear
ssmenu
;;
7)
clear
ssrmenu
;;
8)
clear
vmessmenu
;;
9)
clear
vlessmenu
;;
10)
clear
trmenu
;;
11)
clear
trgomenu
;;
12)
clear
grpcmenu
;;
13)
clear
slowdnsmenu
;;
14)
clear
ipsaya
;;
15)
clear
running
;;
16)
clear
updatemenu
;;
17)
clear
sl-fix
;;
18)
clear
setmenu
;;
19)
clear
exit
;;
20)
clear
copyrepo
;;
21)
clear
menuinfo
;;
*)
clear
menu
;;
esac
