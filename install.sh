RED='\033[1;31m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
BLUE='\033[1;35m'
WHITE='\033[1;37m'

msg(){
	printf " ${WHITE}- Installing  ${YELLOW}$1"
}

ok(){
	printf " ${GREEN} (\u2714 )\n"
}

printf "\n${GREEN}Starting Install ${RED}CoderOJ ${GREEN}Judger Server\n\n"

msg "Update"
sudo apt update > update.txt 2> error.txt
ok

msg "Apache2"
sudo apt install -y apache2 > apache2.txt 2> error.txt
ok

msg "PHP"
sudo apt install -y php libapache2-mod-php php-mysql > php.txt 2> error.txt
ok

printf "\n"

msg "C, C++, C++11"
sudo apt install -y build-essential > cpp.txt 2> error.txt
sudo apt-get install -y manpages-dev > cpp1.txt 2> error.txt
ok
msg "Java"
sudo apt install -y default-jre > java.txt 2> error.txt
ok
msg "Python2"
sudo apt install -y python2 > python2.txt 2> error.txt
ok
msg "Python3"
sudo apt install -y python3 > python3.txt 2> error.txt
ok

printf "\n"
printf " ${WHITE}- CD          ${YELLOW}/var/www/html\n"
cd ../../var/www/html
printf " ${WHITE}- Cloning    ${YELLOW} https://github.com/coderoj-dev/JudgerController"
git clone https://github.com/coderoj-dev/JudgerController > gitclone.txt 2> error.txt
ok
printf " ${WHITE}- CD          ${YELLOW}JudgerController\n"
cd JudgerController
printf " ${WHITE}- Permission  ${YELLOW}run.sh"
bash run.sh > runsh.txt 2> error.txt
ok

hostUrl=`hostname -I`
hostUrl=${hostUrl%% *}

printf "\n${GREEN}Install Success ${RED}CoderOJ ${GREEN}Judger Server ${WHITE}(http://${hostUrl}/JudgerController)\n\n"


