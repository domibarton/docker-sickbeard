FROM debian:8
MAINTAINER confirm IT solutions, dbarton

RUN apt-get -q update \
    && apt-get install -qy git python-cheetah python-openssl \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

RUN groupadd -r -g 666 sickbeard \
    && useradd -r -u 666 -g 666 sickbeard

RUN git clone https://github.com/midgetspy/Sick-Beard.git /sickbeard \
    && chown -R sickbeard: /sickbeard

ADD start.sh /start.sh
RUN chown sickbeard: /start.sh \
    && chmod 755 /start.sh

VOLUME ['/datadir', '/media']

EXPOSE 8080

USER sickbeard

WORKDIR /sickbeard
CMD /start.sh
