sudo apt update
sudo apt install -y apache2
sudo apt install -y php libapache2-mod-php php-mysql

sudo apt install -y build-essential
sudo apt-get install -y manpages-dev
sudo apt install -y default-jre
sudo apt install -y python2
sudo apt install -y python3

cd ../../var/www/html
git clone https://github.com/coderoj-dev/JudgerController
cd JudgerController
bash run.sh
