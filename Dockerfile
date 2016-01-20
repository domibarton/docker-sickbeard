FROM debian:8
MAINTAINER Dominique Barton

#
# Install all required dependencies.
#

RUN apt-get -q update \
    && apt-get install -qy git python-cheetah python-openssl \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

#
# Create user and group for SABnzbd.
#

RUN groupadd -r -g 666 sickbeard \
    && useradd -r -u 666 -g 666 -d /sickbeard sickbeard

#
# Get SickBeard repository.
#

RUN git clone -b master https://github.com/midgetspy/Sick-Beard.git /sickbeard \
    && chown -R sickbeard: /sickbeard

#
# Add SickBeard init script.
#

ADD sickbeard.sh /sickbeard.sh
RUN chmod 755 /sickbeard.sh

#
# Define container settings.
#

VOLUME ["/datadir", "/media"]

EXPOSE 8081

#
# Start SickBeard.
#

WORKDIR /sickbeard

CMD ["/sickbeard.sh"]
