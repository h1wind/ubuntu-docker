FROM ubuntu:20.04

ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 \
	&& apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y --fix-missing \
		apt-utils \
		locales \
		tmux \
		binwalk \
		file \
		strace \
		patchelf \
		qemu-user-static \
		binutils \
		gdb \
		gdb-multiarch \
		gcc \
		gcc-multilib \
		g++-multilib \
		build-essential \
		nasm \
		python2 \
		python3 \
		python3-pip \
		python3-distutils \
		rubygems \
		ruby-dev \
		make \
		automake \
		autoconf \
		cmake \
		wget \
		curl \
		nmap \
		netcat \
		socat \
		net-tools \
		git \
		telnet \
		iputils-ping \
		dnsutils \
		whois \
		vim \
		ltrace \
		tcpdump \
		exiftool \
		squashfs-tools \
		unzip \
		upx-ucl \
		man-db \
		manpages-posix \
		manpages-dev \
		libtool-bin \
		gperf \
		libseccomp-dev \
		libini-config-dev \
		libssl-dev \
		libffi-dev \
		libc6-dbg \
		libglib2.0-dev \
		libc6:i386 \
		libc6-dbg:i386 \
		libncurses5:i386 \
		libstdc++6:i386 \
		libc6-dev-i386 \
	&& apt-get autoremove -y \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& locale-gen en_US.UTF-8 \
	&& update-locale \
	&& wget https://bootstrap.pypa.io/pip/2.7/get-pip.py \
	&& python2 get-pip.py \
	&& rm get-pip.py \
	&& gem install \
		one_gadget \
		seccomp-tools \
	&& python2 -m pip install -U pip \
	&& python2 -m pip install --no-cache-dir \
	        requests \
	&& python3 -m pip install -U pip \
	&& python3 -m pip install --no-cache-dir \
		ropgadget \
		pwntools \
		capstone \
		requests \
		r2pipe \
		scapy \
		python-constraint \
		pycipher \
		uncompyle6 \
		pipenv \
		ropper \
		meson \
		ninja \
		xortool \
	&& cd /opt \
	&& wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-armv4l.tar.bz2 \
	&& wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-armv5l.tar.bz2 \
	&& wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-i586.tar.bz2 \
	&& wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-i686.tar.bz2 \
	&& wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-mips.tar.bz2 \
	&& wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-mipsel.tar.bz2 \
	&& wget http://musl.cc/armv6-linux-musleabi-cross.tgz \
	&& ls *.tar.bz2 | xargs -I {} tar jxvf {} \
	&& ls *.tgz | xargs -I {} tar zxvf {} \
	&& rm -rf *.tar.bz2 *.tgz \
	&& ls | xargs -I {} echo "export PATH=\$PATH:$(pwd)/{}/bin" >> /etc/bash.bashrc \
	&& git clone https://github.com/hugsy/gef \
	&& git clone https://github.com/pwndbg/pwndbg \
	&& git clone https://github.com/longld/peda \
	&& cd pwndbg \
	&& ./setup.sh \
	&& echo "# source /opt/gef/gef.py" >> ~/.gdbinit \
	&& echo "# source /opt/peda/peda.py" >> ~/.gdbinit
