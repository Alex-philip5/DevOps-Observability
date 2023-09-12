# DevOps-Observability FOSS Stack
--![Prometheus-Server_Chart](https://github.com/Allu-Philip/DevOps-Observability/assets/33429916/8287cec1-aa63-4896-9336-83059683c9f5)
--
After cloning, we now need to change the configuration files targets.json and prometheus.yml. 
--
Therefore, we shall execute a script to automate this process.
--
$ cd  DevOps-Observability
--
$ sh scripts/servicediscovery.sh
--
After all changes in configs now lets spin up the containers
--
$ docker-compose -f monit.yml up -d
--
$ docker-compose -f monit.yml logs -f
--
My public IP address, for instance, was 34.56.23.18. Adjust it to reflect yours.
--
So let’s check the webpages as follows
--
Prometheus- http://34.56.23.18:9090
--
Grafana- http://34.56.23.18:3000
--
Alertmanager- http://34.56.23.18:9093
--
Nodeexporter-http://34.56.23.18:9100
--
Happy Learning!







