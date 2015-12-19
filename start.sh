#!/bin/sh

echo 'Updating SickBeard...'
git pull

echo 'Starting SickBeard...'
exec ./SickBeard.py --nolaunch --datadir=/datadir --config=/datadir/config.ini
