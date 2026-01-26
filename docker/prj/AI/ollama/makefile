d=sudo docker
bn=ollama_b
OV=v0.14.3

DIDF=ollama.did

def: start

start: runDS
stop: stopDS
log: logboot

build:
	sudo docker build -t $(bn) .
	
dlOllama:
	[ -e ollama-linux-amd64_$(OV).tar.zst ] || curl -o ollama-linux-amd64_$(OV).tar.zst -L https://github.com/ollama/ollama/releases/download/$(OV)/ollama-linux-amd64.tar.zst
	ln -fs ollama-linux-amd64_$(OV).tar.zst ollama-linux-amd64.tar.zst
	mkdir -p /dev/shm/tmp
	ln -sf /dev/shm/tmp	
	tar -xvf ollama-linux-amd64.tar.zst -C tmp/
	cd tmp; rm -rf lib/ollama/cuda_v1[23] lib/ollama/mlx_cuda_v13 lib/ollama/vulkan
	cd tmp; tar czf ollama-linux-amd64.tar.gz bin lib
	mv tmp/ollama-linux-amd64.tar.gz .
	rm -rf tmp /dev/shm/tmp
	
bDevuan:
	cd ../../../devuan; make bn=ddaedalus V=daedalus build

bAll: bDevuan dlOllama build

runDS:	
	$(d) run -d -p 11434:11434 -v $(PWD)/ollamaD:/root/.ollama --name ollama --net=host $(bn) sh -c "ollama serve" > $(DIDF)
	
stopDS:
	$(d) stop `cat $(DIDF)`
	$(d) rm `cat $(DIDF)`
	mv $(DIDF) $(DIDF)_old
	
logboot:
	sudo tail -f tor/log | grep Bootstrap
	
lAll:
	$(d) logs `cat $(DIDF)`
	
run:
	#sudo docker run -p 8080:80 -p 22:22 $(bn) sh -c "supervisord -c /etc/supervisor/supervisord.conf"
	#sudo docker run -p 8080:80 -p 22:22 $(bn)
	$(d) run -p 11434:11434 $(bn) sh -c "ollama serve"
	#$(d) run -p 11434:11434 $(bn)
	
sh:
	$(d) run -it -v $(PWD)/ollamaD:/root/.ollama $(bn) /bin/bash
	
s:
	$(d) ps	
	$(d) stats --no-stream
	
clean:
	$(d) rmi $(shell sudo docker images --filter=reference="$(bn)" -q)
	
cAuxF:
	sudo rm -rf ollamaD ollama-*
	
bench:
	$(d) run -it $(bn) openssl speed -seconds 30 -bytes 8129 -multi 4 sha256
  
info:
	$(d) system df
	$(d) images
	
pAll: #Delete all docker images and files.
	$(d) system prune --all
	
syncModels:
	rsync -avP ~/.ollama/* ollamaD/
	
syncIF:
	rsync -avP makefile ollama.sh Dockerfile readme.me .screenrc .gitignore .dockerignore ifD.LabSO/