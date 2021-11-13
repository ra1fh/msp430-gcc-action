FROM debian:11.1
RUN apt-get update && apt-get -y install \
	cmake \
	doxygen \
	git \
	libarchive-tools \
	mspdebug \
	python3-sortedcontainers \
	python3-urwid \
    && rm -rf /var/lib/apt/lists/*
ADD http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/9_3_1_2/export/msp430-gcc-full-linux-x64-installer-9.3.1.2.7z /
RUN bsdtar xf msp430-gcc-full-linux-x64-installer-9.3.1.2.7z \
    && chmod +x msp430-gcc-full-linux-x64-installer-9.3.1.2.run \
    && ./msp430-gcc-full-linux-x64-installer-9.3.1.2.run --mode unattended \
    && rm msp430-gcc-full-linux-x64-installer-9.3.1.2.7z
COPY entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh
ENV MSP430_TI /root/ti/msp430-gcc
ENV PATH $PATH:/root/ti/msp430-gcc/bin
ENTRYPOINT ["/entrypoint.sh"]
