# DevOps-Observability


Observability Stack- Prometheus+Grafana+Alertmanager
--![Prometheus-Server_Chart](https://github.com/Allu-Philip/DevOps-Observability/assets/33429916/8287cec1-aa63-4896-9336-83059683c9f5)
--
After clone now we need to edit the configuration files prometheus.yml & targets.json. 
So we will run a script for automating this task.
--
$ cd  DevOps-Observability
$ sh scripts/servicediscovery.sh
--

After all changes in configs now lets spin up the containers
$ docker-compose -f monit.yml up -d
$ docker-compose -f monit.yml logs -f

For Example my public ip was 34.56.23.18

So let’s check the webpages as follows

Prometheus- http://34.56.23.18:9090
Grafana- http://34.56.23.18:3000
Alertmanager- http://34.56.23.18:9093
Nodeexporter-http://34.56.23.18:9100
PS- Change it to accordingly with you PublicIP
Happy Learning!







