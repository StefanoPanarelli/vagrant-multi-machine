#!/bin/bash

# Aggiorna i repository
sudo apt-get update

# Installa Apache
sudo apt-get install -y apache2

# Installa PHP
sudo apt-get install -y php libapache2-mod-php php-mysql

# Abilita l'estensione mysqli
sudo sed -i 's/;extension=mysqli/extension=mysqli/' /etc/php/8.1/apache2/php.ini

# Riavvia Apache
sudo systemctl restart apache2

# Check status
sudo systemctl status apache2

#Questo script esegue i seguenti passaggi:

#Aggiorna i repository di Ubuntu.
#Installa Apache.
#Installa PHP.
#Abilita l'estensione PHP per MySQL.
#Riavvia Apache.