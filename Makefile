.PHONY: all service-discovery setup

all: service-discovery setup

service-discovery:
	@echo "Service Discovery V1.0"
	@echo "---------------------------------------------------"
	@echo "Make sure you run this script as the root user..."
	@echo "---------------------------------------------------"
	sleep 1
	@echo "Checking User Privileges..."
	sleep 2
	if [ "$$(id -u)" != "0" ]; then \
		echo "---------------------------------------------------"; \
		echo "[Permission Error] Run the script as root user"; \
		echo "Exiting !"; \
		echo "---------------------------------------------------"; \
		exit 1; \
	fi
	@echo "==============================================="
	@echo "Service Discovery"
	@echo "==============================================="
	@echo "Fetching the Public IP Address"
	cd scripts
	pub_ip=$$(curl wgetip.com)
	file="./prometheus/prometheus.yml"
	file2="./prometheus/targets.json"
	ip="localhost"
	printf "%s\nThe Public IP is: $$pub_ip \n"
	@echo "Replacing $$ip with $$pub_ip in $$file"
	sed -i "s/$$ip/$$pub_ip/g" "$$file"
	@echo "The Updated $$file"
	cat "$$file"
	@echo "Replacing $$ip with $$pub_ip in $$file2"
	sed -i "s/$$ip/$$pub_ip/g" "$$file2"
	@echo "The Updated $$file2"
	cat "$$file2"

setup:
	@echo "Setting up the environment..."
	# Update the package list and upgrade the installed packages
	sudo apt-get update -y

	# Add Swap Memory of 2GB
	sudo swapon --show
	free -h
	df -h
	sudo fallocate -l 2G /swapfile
	ls -lh /swapfile
	sudo chmod 600 /swapfile
	ls -lh /swapfile
	sudo mkswap /swapfile
	sudo swapon /swapfile
	sudo swapon --show
	free -h
	cat /proc/sys/vm/swappiness
	sudo sysctl vm.swappiness=10
	cat /proc/sys/vm/vfs_cache_pressure
	sudo sysctl vm.vfs_cache_pressure=50

	# Install essential packages
	sudo apt-get install -y curl net-tools wget unzip tree

	# Install Docker
	sudo apt-get install -y docker.io

	# Install Docker Compose
	sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$$(uname -s)-$$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

	# Start the Docker service
	sudo systemctl start docker
	sudo systemctl enable docker

	# Output Docker and Docker Compose versions
	docker --version
	docker-compose --version

