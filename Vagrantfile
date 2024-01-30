# -*- mode: ruby -*-
# vi: set ft=ruby :

#subconfig.vm.network  "forwarded_port", guest: 80 , host: 8080

Vagrant.configure("2") do |config|
  
	# IMAGE
	BOX_IMAGE = "ubuntu/jammy64"
	
	# PROXY
	PROXY_URL = "http://10.20.5.51:8888"
	NO_PROXY = "localhost, 127.0.0.1"
	PROXY_ENABLE = false
	
	# NAMES
	WEB_NAME = "web-m340"
	DB_NAME = "db-m340"
	
	# IPs
	BASE_INT_NETWORK = "10.10.20"
	BASE_HOST_ONLY_NETWORK = "192.168.56"
	WEB_INT_NETWORK = ".10"
	DB_INT_NETWORK = ".11"
	WEB_HOST_ONLY_NETWORK = ".10"
	
	# VMs
	GUI = true
	MEMORY = "1024"
	
	# PROVISIONER CONFIGURATION
    PROVISION_SCRIPTS = ["scripts/install_apache2.sh", "scripts/install_mysql.sh"]
	
	# USEFULL VARs
	INSERT_KEY = false
	
	config.vm.define "web" do |subconfig|
	  subconfig.vm.box = BOX_IMAGE
	  subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}#{WEB_INT_NETWORK}", virtualbox__intnet: true
	  subconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}#{WEB_HOST_ONLY_NETWORK}"
      subconfig.vm.hostname = WEB_NAME
	  subconfig.ssh.insert_key = INSERT_KEY
	
	  subconfig.vm.provider "virtualbox" do |vb|
	    vb.name= WEB_NAME
	 	vb.gui = GUI
	 	vb.memory = MEMORY
	  end
	  
	  # Configure proxy if enabled
	  if PROXY_ENABLE
	    if Vagrant.has_plugin?("vagrant-proxyconf")
		  subconfig.proxy.http = PROXY_URL
		  subconfig.proxy.https = PROXY_URL
		  subconfig.proxy.no_proxy = NO_PROXY
	    end
	  end
	
	  subconfig.vm.synced_folder "./site", "/var/www/html"
	  subconfig.vm.provision "shell" , path: PROVISION_SCRIPTS[0]
	end
  
	config.vm.define "db" do |subconfig|
	  subconfig.vm.box = BOX_IMAGE
	  subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}#{DB_INT_NETWORK}", virtualbox__intnet: true
	  subconfig.vm.hostname = DB_NAME
	  subconfig.ssh.insert_key = INSERT_KEY
	  
	  subconfig.vm.provider "virtualbox" do |vb|
	    vb.name= DB_NAME
	 	vb.gui = GUI
	 	vb.memory = MEMORY
	  end
	  
	  # Configure proxy if enabled
	  if PROXY_ENABLE
	    if Vagrant.has_plugin?("vagrant-proxyconf")
		  subconfig.proxy.http = PROXY_URL
		  subconfig.proxy.https = PROXY_URL
		  subconfig.proxy.no_proxy = NO_PROXY
	    end
	  end
	  subconfig.vm.provision "shell" , path: PROVISION_SCRIPTS[1]
	end
  end

