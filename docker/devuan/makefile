bn=devtest

#beowulf  3.0 glibc 2.28 ~ 142.3MB
#chimaera 4.0 glibc 2.31 ~ 148  MB
#daedalus 5.0 glibc 2.36 ~ 35.73MB

#V=beowulf
V=chimaera
#V=daedalus

def: bD 

build:
	sudo docker build --build-arg VER=$(V) -t $(bn) -f Dockerfile.def .
	
buildSV:
	sudo docker build --build-arg VER=$(V) -t $(bn) -f Dockerfile.$(V) .
	
#Versions
bBW:
	sudo make buildSV V=beowulf
	
bCH:
	sudo make build V=chimaera

bD:
	sudo make build V=daedalus

run:
	sudo docker run -it $(bn) /bin/bash

rDI:
	sudo docker run -it $(bn) sh -c "dpkg -l | grep -i '^ii.*libc\-'; cat /etc/os-release | head -4"	
	#sudo docker inspect $(bn)	
	sudo docker inspect --format='{{.Size}} Bytes, Cmd: {{json .ContainerConfig.Cmd}}' $(bn)
	
clean:
	sudo docker rmi $(shell sudo docker images --filter=reference="$(bn)" -q)
	
bench:
	sudo docker run -it $(bn) openssl speed -seconds 30 -bytes 8129 -multi 4 sha256
