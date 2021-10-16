printf "Installing Start..\n"
sudo apt update > update.txt 2> error.txt
printf "Installing apache2..\n"
sudo apt install -y apache2 > apache2.txt 2> error.txt
printf "Installing php..\n"
sudo apt install -y php libapache2-mod-php php-mysql > php.txt 2> error.txt


printf "Installing C++..\n"
sudo apt install -y build-essential > cpp.txt 2> error.txt
sudo apt-get install -y manpages-dev > cpp1.txt 2> error.txt
printf "Installing Java..\n"
sudo apt install -y default-jre > java.txt 2> error.txt
printf "Installing Python2..\n"
sudo apt install -y python2 > python2.txt 2> error.txt
printf "Installing Python3..\n"
sudo apt install -y python3 > python3.txt 2> error.txt

cd ../../var/www/html
printf "Clone Github..\n"
git clone https://github.com/coderoj-dev/JudgerController > gitclone.txt 2> error.txt
cd JudgerController
bash run.sh > runsh.txt 2> error.txt

printf "Successfully Complete..\n"

