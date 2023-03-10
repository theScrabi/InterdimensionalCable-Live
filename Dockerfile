FROM ubuntu:22.04

ENV HOME=/home \
	VNC_PORT=5091


EXPOSE $VNC_PORT
WORKDIR /home

RUN apt-get update && \
	apt-get install -y locales && \
	apt-get clean -y && \
	locale-gen en_US.UTF-8


ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y wget \ 
		net-tools \
		locales \
		bzip2 \
		supervisor \
		fluxbox \
		xinit \
		obs\
		xdotool && \
		apt-get clean -y  

# letsinstall tigervnc
RUN wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.8.0.x86_64.tar.gz | tar xz --strip 1 -C /

ENV DISPLAY=:1 \
	VNC_COL_DEPTH=24 \
	VNC_RESOLUTION=800x600 \
	VNC_PW=testpwd

RUN mkdir $HOME/.vnc && \
	echo $VNC_PW | vncpasswd -f > $HOME/.vnc/passwd && \
	chmod 600 $HOME/.vnc/passwd
	

ADD supervisor.conf /etc/supervisor/conf.d/tiger_supervisor.conf

CMD /usr/bin/supervisord

