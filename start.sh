#!/bin/sh

echo "Updating SickBeard git repository..."
git pull

if [[ -n "${VERSION}" ]]
then
    echo "Checking out SickBeard version '${VERSION}'..."
    git checkout ${VERSION}
fi

CONFIG=${CONFIG:-/datadir/config.ini}
echo "Starting SickBeard with config '${CONFIG}'..."
exec ./SickBeard.py --nolaunch --datadir=/datadir --config=${CONFIG}
