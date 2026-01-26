FROM ddaedalus

RUN apt -y update
RUN apt -y upgrade

RUN apt -y install zstd

#Auxs
RUN apt -y install htop screen lsof dnsutils iputils-ping nano

#Config files

COPY .screenrc /root/

RUN mkdir /tmp/a
COPY ollama-linux-amd64.tar.gz /tmp/a/

RUN cd /tmp/a && \ 
tar -xf ollama-linux-amd64.tar.gz && \ 
rm -rf ollama-linux-amd64.tar.gz

RUN mv /tmp/a /ollama

COPY ollama.sh /usr/bin

RUN ln -sf /ollama/bin/ollama /usr/bin/ollama

RUN echo 'alias ol="ollama.sh"' >> ~/.bashrc
RUN echo 'alias ols="ol list"' >> ~/.bashrc
RUN echo 'alias olps="ollama ps"' >> ~/.bashrc
RUN echo 'alias olr="ollama run granite4:1b-q4_K_M"' >> ~/.bashrc
RUN echo 'alias olrt="ollama run qwen3:0.6b"' >> ~/.bashrc

RUN echo 'alias sco="screen -S "Ollama" -m -c ~/.screenrc"' >> ~/.bashrc
RUN echo 'alias pico="nano"' >> ~/.bashrc

#Clean up
RUN apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /ollama

EXPOSE 11434

#ENTRYPOINT [ "ollama", "serve" ]