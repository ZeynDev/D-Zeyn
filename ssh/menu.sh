#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"

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
domain=$(cat /usr/local/etc/xray/domain)
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
WKT=$(cat /usr/local/etc/xray/timezone)
DATE=$(date -R | cut -d " " -f -4)
MYIP=$(curl -sS ipv4.icanhazip.com)
clear

echo -e ""
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "               ${WB}----- [ D-Zeyn Script ] -----${NC}              "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${YB}Service Provider${NC} ${WB}: $ISP"
echo -e " ${YB}Timezone${NC}         ${WB}: $WKT${NC}"
echo -e " ${YB}City${NC}             ${WB}: $CITY${NC}"
echo -e " ${YB}Date${NC}             ${WB}: $DATE${NC}"
echo -e " ${YB}Domain${NC}           ${WB}: $domain${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "     ${WB}NGINX STATUS :${NC} $status_nginx    ${WB}XRAY STATUS :${NC} $status_xray   "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "          ${WB}----- [ Bandwidth Monitoring ] -----${NC}"
echo -e ""
echo -e "  ${GB}Today ($DATE)     Monthly ($(date +%B/%Y))${NC}      "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "    ${GB}↓↓ Down: $dtoday          ↓↓ Down: $dmon${NC}   "
echo -e "    ${GB}↑↑ Up  : $utoday          ↑↑ Up  : $umon${NC}   "
echo -e "    ${GB}≈ Total: $ttoday          ≈ Total: $tmon${NC}   "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ SSH & OpenVPN Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[1]${NC} ${YB}Create ${NC}            ${MB}[6]${NC} ${YB}Delete SSH & OpenVPN Account${NC}"
echo -e " ${MB}[2]${NC} ${YB}Trial ${NC}             ${MB}[7]${NC} ${YB}Delete User Expired${NC}"
echo -e " ${MB}[3]${NC} ${YB}Perpanjang ${NC}        ${MB}[8]${NC} ${YB}Set up Autokill SSH${NC}"
echo -e " ${MB}[4]${NC} ${YB}Check User Login${NC}   ${MB}[9]${NC} ${YB}Displays Users Who Do Multi Login SSH${NC}"
echo -e " ${MB}[5]${NC} ${YB}Daftar Member${NC}      ${MB}[10]${NC} ${YB}Restart All Service${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ L2TP Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[11]${NC} ${YB}Create Account L2TP${NC}"
echo -e " ${MB}[12]${NC} ${YB}Delete Account L2TP${NC}"
echo -e " ${MB}[13]${NC} ${YB}Perpanjang Masa Aktif${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ PPTP Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[14]${NC} ${YB}Create Account PPTP${NC}"
echo -e " ${MB}[15]${NC} ${YB}Delete Account PPTP${NC}"
echo -e " ${MB}[16]${NC} ${YB}Perpanjang Masa Aktif${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ SSTP Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[17]${NC} ${YB}Create Account SSTP${NC}"
echo -e " ${MB}[18]${NC} ${YB}Delete Account SSTP${NC}"
echo -e " ${MB}[19]${NC} ${YB}Perpanjang Masa Aktif${NC}"
echo -e " ${MB}[20]${NC} ${YB}Check User Login${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ Wireguard Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[21]${NC} ${YB}Create Account Wireguard${NC}"
echo -e " ${MB}[22]${NC} ${YB}Delete Account Wireguard${NC}"
echo -e " ${MB}[23]${NC} ${YB}Perpanjang Masa Aktif${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ SHADOWSOCKS Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[24]${NC} ${YB}Create Account SHADOWSOCKS${NC}"
echo -e " ${MB}[25]${NC} ${YB}Delete Account SHADOWSOCKS${NC}"
echo -e " ${MB}[26]${NC} ${YB}Perpanjang Masa Aktif${NC}"
echo -e " ${MB}[27]${NC} ${YB}Check User Login${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ SHADOWSOCKSR Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[28]${NC} ${YB}Create Account SSR${NC}"
echo -e " ${MB}[29]${NC} ${YB}Delete Account SSR${NC}"
echo -e " ${MB}[30]${NC} ${YB}Perpanjang Masa Aktif${NC}"
echo -e " ${MB}[31]${NC} ${YB}Show Other SSR Menu${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ Xray Vmess Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[32]${NC} ${YB}Create Vmess WS${NC}          ${MB}[36]${NC} ${YB}Renew Certificate XRAY${NC}"
echo -e " ${MB}[33]${NC} ${YB}Delete Vmess WS${NC}"
echo -e " ${MB}[34]${NC} ${YB}Perpanjang Vmess${NC}"
echo -e " ${MB}[35]${NC} ${YB}Check User Login${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ Vless Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[37]${NC} ${YB}Create Vless WS${NC}"
echo -e " ${MB}[38]${NC} ${YB}Delete Vless WS${NC}"
echo -e " ${MB}[39]${NC} ${YB}Perpanjang Vmess${NC}"
echo -e " ${MB}[40]${NC} ${YB}Check User Login${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ Trojan XRAYS Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[41]${NC} ${YB}Create XRAYS TROJAN${NC}"
echo -e " ${MB}[42]${NC} ${YB}Delete XRAYS TROJAN${NC}"
echo -e " ${MB}[43]${NC} ${YB}Perpanjang TROJAN${NC}"
echo -e " ${MB}[44]${NC} ${YB}Check User Login${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}----- [ Trojan GO Menu ] -----${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[45]${NC} ${YB}Create TROJAN GO${NC}"
echo -e " ${MB}[46]${NC} ${YB}Delete TROJAN GO${NC}"
echo -e " ${MB}[47]${NC} ${YB}Perpanjang TROJAN GO${NC}"
echo -e " ${MB}[48]${NC} ${YB}Check User Login${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                 ${WB}----- [ Utility ] -----${NC}                "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[49]${NC} ${YB}Add Or Change Subdomain Host For VPS${NC}  ${MB}[55]${NC} ${YB}Limit Bandwith Speed Server${NC}"
echo -e " ${MB}[50]${NC} ${YB}Change Port Of Some Service${NC}           ${MB}[56]${NC} ${YB}Check Usage of VPS Ram${NC}"
echo -e " ${MB}[51]${NC} ${YB}Autobackup Data VPS${NC}                   ${MB}[57]${NC} ${YB}Reboot VPS${NC}"
echo -e " ${MB}[52]${NC} ${YB}Backup Data VPS${NC}                       ${MB}[58]${NC} ${YB}Speedtest VPS${NC}"
echo -e " ${MB}[53]${NC} ${YB}Restore Data VPS${NC}                      ${MB}[59]${NC} ${YB}Displaying System Information${NC}"
echo -e " ${MB}[54]${NC} ${YB}Webmin Menu${NC}                           ${MB}[60]${NC} ${YB}Info Script Auto Install${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e ""
read -p "Select From Options [ 1 - 60 ] : " menu
echo -e ""
case $menu in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
cekssh
;;
5)
member
;;
6)
delssh
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
11)
addl2tp
;;
12)
dell2tp
;;
13)
renewl2tp
;;
14)
addpptp
;;
15)
delpptp
;;
16)
renewpptp
;;
17)
addsstp
;;
18)
delsstp
;;
19)
renewsstp
;;
20)
ceksstp
;;
21)
addwg
;;
22)
delwg
;;
23)
renewwg
;;
24)
addss
;;
25)
delss
;;
26)
renewss
;;
27)
cekss
;;
28)
addssr
;;
29)
delssr
;;
30)
renewssr
;;
31)
ssr
;;
32)
addvmess
;;
33)
delvmess
;;
34)
renewvmess
;;
35)
cekvmess
;;
36)
certv2ray
;;
37)
addvless
;;
38)
delvless
;;
39)
renewvless
;;
40)
cekvless
;;
41)
addtrojan
;;
42)
deltrojan
;;
43)
renewtrojan
;;
44)
cektrojan
;;
45)
addtrgo
;;
46)
deltrgo
;;
47)
renewtrgo
;;
48)
cektrgo
;;
49)
addhost
;;
50)
changeport
;;
51)
autobackup
;;
52)
backup
;;
53)
restore
;;
54)
wbmn
;;
55)
limitspeed
;;
56)
ram
;;
57)
reboot
;;
58)
speedtest
;;
59)
info
;;
60)
about
;;
*)
clear
menu
;;
esac
