FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y python-pip wget gdebi ruby rsync git wget curl

RUN pip install --upgrade pip setuptools
RUN wget -q http://ftp.us.debian.org/debian/pool/main/l/lsb/lsb-security_4.1+Debian13+nmu1_amd64.deb && \
    wget -q http://ftp.us.debian.org/debian/pool/main/l/lsb/lsb-invalid-mta_4.1+Debian13+nmu1_all.deb && \
    wget -q http://ftp.us.debian.org/debian/pool/main/l/lsb/lsb-core_4.1+Debian13+nmu1_amd64.deb
RUN gdebi --n lsb-security_4.1+Debian13+nmu1_amd64.deb && \
    gdebi --n lsb-invalid-mta_4.1+Debian13+nmu1_all.deb && \
    gdebi --n lsb-core_4.1+Debian13+nmu1_amd64.deb
RUN apt-get -f install
RUN pip install --upgrade pip setuptools
RUN pip install virtualenv pygments pymdown-extensions==6.2.1 titlecase mkdocs mkdocs-material==4.6.0
RUN useradd -lM nginx
