printf "Installing Start..\n"
sudo apt update > update.txt
sudo apt install -y apache2 > apache2.txt
sudo apt install -y php libapache2-mod-php php-mysql > php.txt

sudo apt install -y build-essential > cpp.txt
sudo apt-get install -y manpages-dev > cpp1.txt
sudo apt install -y default-jre > java.txt
sudo apt install -y python2 > python2.txt
sudo apt install -y python3 > python3.txt

cd ../../var/www/html
git clone https://github.com/coderoj-dev/JudgerController > gitclone.txt
cd JudgerController
bash run.sh > runsh.txt

printf "Successfully Complete..\n"

