# EC2 Instance Variables
region         = "ap-south-2"
ami_id         = "ami-04590bdf0114d5449"
instance_type  = "t4g.nano"
key_name       = "poc-key"
instance_count = 1
subnet_ids     = ["subnet-00d9a59cb0acc1561", "subnet-0bfe5974459f3727b", "subnet-07a42a4c10943b8e5"]

# EC2 Security Group Variables
vpc_id  = "vpc-036bbd232dff73a78"

# EC2 Userdata
# user_data     = "user-data.sh"

# Tag Keys
name        = "poc-new"
owner       = "alex"
environment = "dev"
cost_center = "poc"
application = "monit"


# CIDR Ingress Variables
create_ingress_cidr        = true
ingress_cidr_from_port     = [22, 80, 443, 9090, 9100, 9093, 3000]  # List of from ports
ingress_cidr_to_port       = [22, 80, 443, 9090, 9100, 9093, 3000]  # List of to ports
ingress_cidr_protocol      = ["tcp", "tcp", "tcp", "tcp", "tcp", "tcp", "tcp"]        # Protocol for all rules (you can add more if needed)
ingress_cidr_block         = ["0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"]
ingress_cidr_description   = ["SSH", "HTTP", "HTTPS", "Prometheus", "Node-exporter", "Alert manager", "Grafana"]

# CIDR Egress Variables
create_egress_cidr    = true
egress_cidr_from_port = [0]
egress_cidr_to_port   = [0]
egress_cidr_protocol  = ["-1"]
egress_cidr_block     = ["0.0.0.0/0"]


