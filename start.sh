#!/bin/sh

if [[ -n "${VERSION}" ]]
then
    echo "Checking out SickBeard version '${VERSION}'..."
    git checkout ${VERSION}
fi

echo "Updating SickBeard..."
git pull

CONFIG=${CONFIG:-/datadir/config.ini}
echo "Starting SickBeard with config '${CONFIG}'..."
exec ./SickBeard.py --nolaunch --datadir=/datadir --config=${CONFIG}
