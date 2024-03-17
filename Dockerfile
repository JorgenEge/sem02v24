FROM ubuntu:24.04

RUN apt-get update \
	&& apt-get dist-upgrade -y \
	&& apt-get autoremove -y \
	&& apt-get autoclean -y \
	&& apt-get install -y \
	sudo \
	nano \
	wget \
	curl \
	git \
	build-essential \
	gcc \
	openjdk-21-jdk \
	mono-complete \
	python3 \
	strace \
	valgrind

RUN useradd -G sudo -m -d /home/Spiegelman -s /bin/bash -p "$(opensslpasswd -1 CakeisGay)" Spiegelman

USER Spiegelman
WORKDIR /home/Spiegelman

RUN mkdir hacking \
	&& cd hacking \
	&& curl -SL https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v24/pawned.sh > pawned.sh \
	&& chmod 764 pawned.sh \
	&& cd ..

RUN git config --global user.email "Jorgee17@uia.no"\
	&& git config --global user.name "Jorgen" \
	&& git config --global url."https://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:@github.com/".insteadOf "https://github.com" \
	&& mkdir -p github.com/JorgenEge

USER root
RUN curl -SL https://go.dev/dl/go1.21.7.linux-arm64.tar.gz \
	| tar xvz -C /usr/local

USER Spiegelman
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/Spiegelman/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"
ARG DEBIAN_FRONTEND=noninteractive
RUN curl --proto '=https' --tlsv1.3 https://sh.rustup.rs-sSf \ 
    | sh -s -- -y
ENV PATH="${PATH}:${HOME}/.cargo/bin"