d=sudo docker
bn=opencode

DATE=$(shell date +%Y%m%d)

def: run

build:
	$(d) build -t $(bn) .
	
#Devuan daedalus as base
bDevuan:
	cd devuan; make bD

bAll: bDevuan build

run:	
	$(d) run --rm -it $(bn) /bin/bash
	
oc:	
	$(d) run --rm -it $(bn) /root/.opencode/bin/opencode
	
s:
	$(d) ps	
	$(d) stats --no-stream
	
cleanD:
	$(d) rmi $(shell sudo docker images --filter=reference="$(bn)" -q)
	
bench:
	$(d) run -it $(bn) openssl speed -seconds 30 -bytes 8129 -multi 4 sha256
  
info:
	$(d) system df
	$(d) images