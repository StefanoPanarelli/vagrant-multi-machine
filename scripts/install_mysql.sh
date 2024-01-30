#!/bin/bash

# Aggiorna i repository
sudo apt-get update

# Installa MySQL
sudo apt-get install -y mysql-server

# Imposta una password per l'utente root di MySQL
mysqladmin -u root password "password"

# Configura il database e l'utente
sudo mysql -e "CREATE DATABASE mydatabase; \
CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypassword'; \
GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'%'; \
FLUSH PRIVILEGES;"


sudo sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Riavvia MySQL
sudo systemctl restart mysql

# Check status
sudo systemctl status mysql

#Questo script esegue i seguenti passaggi:

#Aggiorna i repository di Ubuntu.
#Installa MySQL.
#Imposta una password per l'utente root di MySQL.
#Crea un utente non root per l'applicazione web.
#Riavvia MySQL.