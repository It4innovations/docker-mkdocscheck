FROM ubuntu:xenial

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN apt-get -y update && apt-get install -y python-pip wget gdebi ruby rsync git wget curl

RUN pip install pip --upgrade
RUN pip install setuptools --upgrade
RUN wget -q http://ftp.us.debian.org/debian/pool/main/l/lsb/lsb-security_4.1+Debian13+nmu1_amd64.deb
RUN wget -q http://ftp.us.debian.org/debian/pool/main/l/lsb/lsb-invalid-mta_4.1+Debian13+nmu1_all.deb
RUN wget -q http://ftp.us.debian.org/debian/pool/main/l/lsb/lsb-core_4.1+Debian13+nmu1_amd64.deb
RUN gdebi --n lsb-security_4.1+Debian13+nmu1_amd64.deb
RUN gdebi --n lsb-invalid-mta_4.1+Debian13+nmu1_all.deb
RUN gdebi --n lsb-core_4.1+Debian13+nmu1_amd64.deb
RUN apt-get -f install
RUN pip install mkdocs
RUN pip install pygments
RUN pip install pymdown-extensions
#RUN apt -y install nodejs
#RUN npm i markdown-spellcheck -g
