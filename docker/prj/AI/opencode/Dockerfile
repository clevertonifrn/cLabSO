FROM ddaedalus

RUN apt -y clean && rm -rf /var/lib/apt/lists/*
RUN apt -y update
RUN apt -y upgrade

#Auxs + runtime deps
RUN apt -y install ca-certificates curl zstd htop screen lsof dnsutils iputils-ping nano
RUN apt -y install make pbzip2 bash-completion netcat-openbsd

RUN apt -y install locales
RUN echo 'pt_BR.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=pt_BR.UTF-8

#Config Python
RUN apt -y install python3 python3-pip

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN update-alternatives --install /usr/bin/py py /usr/bin/python3 1

RUN pip install -U --break-system-packages pip

#Opencode
RUN curl -fsSL https://opencode.ai/v2/install | bash

RUN mkdir -p /root/.config/opencode
COPY configs/GAGENTS.md /root/.config/opencode/AGENTS.md
COPY configs/opencode.jsonc /root/.config/opencode/opencode.jsonc

#Config files
COPY configs/.bashrc /root/
COPY configs/.bash_aliases /root/
COPY configs/.screenrc /root/

RUN echo "export PATH=/root/.opencode/bin:$PATH" >> /root/.bashrc

RUN mkdir /wrk
WORKDIR /wrk

#Clean up
RUN apt clean && rm -rf /var/lib/apt/lists/*
