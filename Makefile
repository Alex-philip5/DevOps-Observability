.PHONY: all service-discovery 

pub_ip := $(shell curl -s ifconfig.io)
file := ./prometheus/prometheus.yml
file2 := ./prometheus/targets.json
local := 127.0.0.1

service-discovery:
	@echo "The Public IP is : $(pub_ip)"
	@echo "The Loopback Address is : $(local)"
	@sed -i "s/$(local)/$(pub_ip)/g" $(file)
	@echo "====The Updated file prometheus.yml===="
	@cat "$(file)"

	@sed -i "s/$(local)/$(pub_ip)/g" $(file2)
	@echo "====The Updated file targets.json===="
	@cat "$(file2)"

rollback:
	@echo "Rollbacking the changes"
	@echo "The Public IP is : $(pub_ip)"
	@echo "The Loopback Address is : $(local)"
	@sed -i "s/$(pub_ip)/$(local)/g" $(file)
	@echo "====The Updated file prometheus.yml===="
	@cat "$(file)"

	@sed -i "s/$(pub_ip)/$(local)/g" $(file2)
	@echo "====The Updated file targets.json===="
	@cat "$(file2)"

all: service-discovery
