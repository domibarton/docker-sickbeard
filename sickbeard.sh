#!/bin/bash
set -e

#
# Display settings on standard out.
#

USER="sickbeard"

echo "SickBeard settings"
echo "=================="
echo
echo "  User:       ${USER}"
echo "  UID:        ${SICKBEARD_UID:=666}"
echo "  GID:        ${SICKBEARD_GID:=666}"
echo
echo "  Config:     ${CONFIG:=/datadir/config.ini}"
echo

#
# Change UID / GID of SickBeard user.
#

printf "Updating UID / GID... "
[[ $(id -u ${USER}) == ${SICKBEARD_UID} ]] || usermod  -o -u ${SICKBEARD_UID} ${USER}
[[ $(id -g ${USER}) == ${SICKBEARD_GID} ]] || groupmod -o -g ${SICKBEARD_GID} ${USER}
echo "[DONE]"

#
# Set directory permissions.
#

printf "Set permissions... "
touch ${CONFIG}
chown -R ${USER}: /sickbeard
chown ${USER}: /datadir /media $(dirname ${CONFIG})
echo "[DONE]"

#
# Finally, start SickBeard.
#

echo "Starting SickBeard..."
exec ./SickBeard.py --nolaunch --datadir=$(dirname ${CONFIG}) --config=${CONFIG}
