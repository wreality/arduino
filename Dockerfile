FROM ubuntu:latest
MAINTAINER Brian Adams <wreality@gmail.com>

RUN apt-get update ; apt-get install -y wget xz-utils python

RUN mkdir /opt/arduino; \
    cd /opt/arduino; \
    wget --progress=dot -qO arduino.tar.xz https://downloads.arduino.cc/arduino-1.8.9-linux64.tar.xz ; \
    tar -Jxvf arduino.tar.xz

ENV PATH="/opt/arduino/arduino-1.8.9:${PATH}"

RUN  arduino --pref "boardsmanager.additional.urls=http://arduino.esp8266.com/stable/package_esp8266com_index.json" --save-prefs ; \
     arduino --install-boards esp8266:esp8266

RUN rm -rf /var/lib/apt/lists/* ; \
    apt-get -y purge wget xz-utils

WORKDIR /root/Arduino
