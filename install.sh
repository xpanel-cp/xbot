c#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
ENDCOLOR="\e[0m"

if [ "$EUID" -ne 0 ]
then echo "Please run as root"
exit
fi
ENV_FILE="/var/www/html/app/.env"
COPY_FILE="/var/www/html/.env_copy"

if [ -f "$ENV_FILE" ]; then
  cp "$ENV_FILE" "$COPY_FILE"
  chmod 644 /var/www/html/.env_copy
fi
# php7.x is End of life https://www.php.net/supported-versions.php ubuntu bellow 20 is not supported by php8.1 in 2023
if [ "$(uname)" == "Linux" ]; then
    version_info=$(lsb_release -rs)
    # Check if it's Ubuntu and version is below 20
    if [ "$(lsb_release -is)" == "Ubuntu" ] && [ "$(echo "$version_info < 20" | bc)" -eq 1 ]; then
        echo "This Script is using php8.1 and only supported in ubuntu 20 and above"
        exit
    fi
fi

adminuser=$(mysql -N -e "use XPbot; select username from admins where permission='admin';")
adminpass=$(mysql -N -e "use XPbot; select username from admins where permission='admin';")
clear

echo -e "\nPlease input Domain (https://xbot.example.com)"
printf "Domain: "
read ip
if [ -n "$ip" -a "$ip" == " " ]; then
echo -e "\nPlease input Domain (https://xbot.example.com)"
printf "Domain: "
read ip
fi
adminusername=admin
echo -e "\nPlease input Panel admin user."
printf "Default user name is \e[33m${adminusername}\e[0m, let it blank to use this user name: "
read usernametmp
if [[ -n "${usernametmp}" ]]; then
adminusername=${usernametmp}
fi

# Function to generate random uppercase character
function random_uppercase {
    echo $((RANDOM%26+65)) | awk '{printf("%c",$1)}'
}

# Function to generate random lowercase character
function random_lowercase {
    echo $((RANDOM%26+97)) | awk '{printf("%c",$1)}'
}

# Function to generate random digit
function random_digit {
    echo $((RANDOM%10))
}

# Generate a complex password
password=""
password="${password}$(random_uppercase)"
password="${password}$(random_uppercase)"
password="${password}$(random_uppercase)"
password="${password}$(random_uppercase)"
password="${password}$(random_digit)"
password="${password}$(random_digit)"
password="${password}$(random_digit)"
password="${password}$(random_digit)"
password="${password}$(random_lowercase)"
password="${password}$(random_lowercase)"
password="${password}$(random_lowercase)"

adminpassword=${password}


echo -e "\nPlease input Panel admin password."
printf "Randomly generated password is \e[33m${adminpassword}\e[0m, leave it blank to use this random password : "
read passwordtmp
if [[ -n "${passwordtmp}" ]]; then
adminpassword=${passwordtmp}
fi

ipv4=$ip
Lang=fa
echo -e "\nPlease input Lang en/fa"
printf "Lang: "
read lang
if [ -n "$ip" -a "$ip" == " " ]; then
echo -e "\nPlease input Lang en/fa"
printf "Lang: "
read lang
fi

if command -v apt-get >/dev/null; then

sudo NEETRESTART_MODE=a apt-get update --yes
sudo apt-get -y install software-properties-common
apt-get install -y stunnel4 && apt-get install -y cmake && apt-get install -y screenfetch && apt-get install -y openssl
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
apt-get install apache2 zip unzip net-tools curl mariadb-server -y
apt-get install php php-cli php-mbstring php-dom php-pdo php-mysql -y
apt-get install npm -y
sudo apt-get install coreutils
wait
phpv=$(php -v)
if [[ $phpv == *"8.1"* ]]; then

apt autoremove -y
  echo "PHP Is Installed :)"
else
rm -fr /etc/php/7.4/apache2/conf.d/00-ioncube.ini
sudo apt-get purge '^php7.*' -y
apt remove php* -y
apt remove php -y
apt autoremove -y
apt install php8.1 php8.1-mysql php8.1-xml php8.1-curl cron -y
fi
sed -i 's@zend_extension = /usr/local/ioncube/ioncube_loader_lin_8.1.so@@' /etc/php/8.1/cli/php.ini
bash <(curl -Ls https://raw.githubusercontent.com/xpanel-cp/xbot/main/ioncube.sh --ipv4)

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer    
linkd=https://api.github.com/repos/xpanel-cp/xbot/releases/tags/2.0
link=$(sudo curl -Ls "$linkd" | grep '"browser_download_url":' | sed -E 's/.*"([^"]+)".*/\1/')
sudo wget -O /var/www/html/update.zip $link
sudo unzip -o /var/www/html/update.zip -d /var/www/html/ &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/curl' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/crontab' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/mysqldump' | sudo EDITOR='tee -a' visudo &
wait
sudo a2enmod rewrite
wait
sudo service apache2 restart
wait
sudo systemctl restart apache2
wait
sudo service apache2 restart
wait
sudo sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf &
wait
sudo service apache2 restart
wait
clear

echo "<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/bot
    ErrorLog /error.log
    CustomLog /access.log combined
    <Directory '/var/www/html/bot'>
    AllowOverride All
    </Directory>
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet" > /etc/apache2/sites-available/000-default.conf
wait
##Replace 'Virtual Hosts' and 'List' entries with the new port number
echo "Listen 80
<IfModule ssl_module>
    Listen 443
</IfModule>

<IfModule mod_gnutls.c>
    Listen 443
</IfModule>" > /etc/apache2/ports.conf

wait
##Restart the apache server to use new port
sudo /etc/init.d/apache2 reload
sudo service apache2 restart
chown www-data:www-data /var/www/html/bot/* &
wait
systemctl restart mariadb &
wait
systemctl enable mariadb &
wait
sudo phpenmod curl
PHP_INI=$(php -i | grep /.+/php.ini -oE)
sed -i 's/extension=intl/;extension=intl/' ${PHP_INI}

systemctl restart httpd
systemctl enable httpd
fi
mysql -e "create database XPbot;" &
wait
mysql -e "CREATE USER '${adminusername}'@'localhost' IDENTIFIED BY '${adminpassword}';" &
wait
mysql -e "GRANT ALL ON *.* TO '${adminusername}'@'localhost';" &
wait
mysql -e "ALTER USER '${adminusername}'@'localhost' IDENTIFIED BY '${adminpassword}';" &
wait
sed -i "s/DB_USERNAME=.*/DB_USERNAME=$adminusername/g" /var/www/html/app/.env
sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=$adminpassword/g" /var/www/html/app/.env
cd /var/www/html/app
php artisan migrate
if [ -n "$adminuser" -a "$adminuser" != "NULL" ]
then
 mysql -e "USE XPbot; UPDATE admins SET username = '${adminusername}' where permission='admin';"
 mysql -e "USE XPbot; UPDATE admins SET password = '${adminpassword}' where permission='admin';"
else
mysql -e "USE XPbot; INSERT INTO admins (username, password, permission, credit, status) VALUES ('${adminusername}', '${adminpassword}', 'admin', '', 'active');"
mysql -e "USE XPbot; INSERT INTO settings (lang_panel, lang_bot, pay_validate, json_validate) VALUES ('en', 'en', '', '');"
fi
sudo chown -R www-data:www-data /var/www/html/app
crontab -r
wait
multiin=$(echo "${ipv4}/fixer/user")
cat > /var/www/html/cron.sh << ENDOFFILE
#!/bin/bash
#By Alireza
i=0
while [ 1i -lt 20 ]; do
cmd=(bbh '$multiin')
echo cmd &
sleep 30
i=(( i + 1 ))
done
ENDOFFILE
wait
sudo sed -i 's/(bbh/$(curl -v -H "A: B"/' /var/www/html/cron.sh
wait
sudo sed -i 's/cmd/$cmd/' /var/www/html/cron.sh
wait
sudo sed -i 's/1i/$i/' /var/www/html/cron.sh
wait
sudo sed -i 's/((/$((/' /var/www/html/cron.sh
wait
chmod +x /var/www/html/cron.sh
wait
(crontab -l | grep . ; echo -e "* * * * * /var/www/html/cron.sh") | crontab -
(crontab -l ; echo "0 2 * * * wget -q -O /dev/null '${ipv4}/fixer/remove' > /dev/null 2>&1") | crontab -

DEFAULT_APP_LOCALE="$lang"
DEFAULT_APP_MODE=light
DEFAULT_PANEL_DIRECT=cp
DEFAULT_XBOT_TOKEN=none

if [ -f /var/www/html/.env_copy ]; then
  while IFS= read -r line; do
    key=$(echo "$line" | awk -F'=' '{print $1}')
    value=$(echo "$line" | awk -F'=' '{print $2}')

    if [ "$key" = "APP_LOCALE" ]; then
      APP_LOCALE="$value"
    elif [ "$key" = "APP_MODE" ]; then
      APP_MODE="$value"
    elif [ "$key" = "PANEL_DIRECT" ]; then
      PANEL_DIRECT="$value"
    elif [ "$key" = "XBOT_TOKEN" ]; then
      CRON_TRAFFIC="$value"

    fi
  done < /var/www/html/.env_copy
fi

APP_LOCALE="${APP_LOCALE:-$DEFAULT_APP_LOCALE}"
APP_MODE="${APP_MODE:-$DEFAULT_APP_MODE}"
PANEL_DIRECT="${PANEL_DIRECT:-$DEFAULT_PANEL_DIRECT}"
XBOT_TOKEN="${XBOT_TOKEN:-$DEFAULT_XBOT_TOKEN}"

sed -i "s/APP_LOCALE=.*/APP_LOCALE=$APP_LOCALE/g" /var/www/html/app/.env
sed -i "s/APP_MODE=.*/APP_MODE=$APP_MODE/g" /var/www/html/app/.env
sed -i "s/PANEL_DIRECT=.*/PANEL_DIRECT=$PANEL_DIRECT/g" /var/www/html/app/.env
sed -i "s/XBOT_TOKEN=.*/XBOT_TOKEN=$XBOT_TOKEN/g" /var/www/html/app/.env

clear

echo -e "************ XPbot ************ \n"
echo -e "XBot Link : ${ipv4}/${PANEL_DIRECT}/login"
echo -e "Username : ${adminusername}"
echo -e "Password : ${adminpassword}"
