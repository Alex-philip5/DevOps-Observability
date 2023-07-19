# DevOps-Observability


Observability Stack- Prometheus+Grafana+Alertmanager
--![Prometheus-Server_Chart](https://github.com/Allu-Philip/DevOps-Observability/assets/33429916/8287cec1-aa63-4896-9336-83059683c9f5)

Installation of Stack in EC2 Ubuntu environment
--
sudo apt-get update
--
sudo apt-get upgrade
--
sudo apt-get install wget curl -y
--
wget https://github.com/Allu-Philip/DevOps-Observability.git
--
Prequesties
--
Open the following ports for the EC2 instance
--
IPv4	SSH	TCP	22	0.0.0.0/0	– ssh-access
IPv4	HTTPS	TCP	443	0.0.0.0/0	– https aceess
IPv4	Custom TCP	TCP	9100	0.0.0.0/0	node exporter
IPv4	Custom TCP	TCP	3001	0.0.0.0/0	–
IPv4	Custom TCP	TCP	9093	0.0.0.0/0	alert manager
IPv4	Custom TCP	TCP	9091	0.0.0.0/0	–
IPv4	Custom TCP	TCP	3000	0.0.0.0/0	grafana
IPv4	Custom TCP	TCP	9090	0.0.0.0/0	prometheus
IPv4	Custom TCP	TCP	3100	0.0.0.0/0	–
IPv4	Custom TCP	TCP	3030	0.0.0.0/0	–
--

Install Docker & Docker-Compose
--
Run Docker installation Bash script
--
sh docker.sh
--
sudo apt-get install -y docker-compose
--
chown -R 472.472 grafana
--
Edit the default conf file with your EC2 instance Public IP
--
Run the Docker compose file
docker-compose -f monit.yml up -d
--






