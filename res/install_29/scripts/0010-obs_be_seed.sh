#!/bin/bash
set -e

bd="be"

if
    test -r "/host/${bd}.tgz.00"
then
    cat "/host/${bd}.tgz".* > "/host/${bd}.tgz"
fi

if
    test -r "/host/${bd}.tgz"
then
    echo "Importing ${bd}.tgz"
    tar xfzv "/host/${bd}.tgz" -C /srv/obs/
    tar tzf "/host/${bd}.tgz" |
	sed -r 's@(^[^/]+)/.*@\1@' |
	sort -u |
	xargs -r -n 1 -I @ chown -R obsrun:obsrun /srv/obs/@
    echo "Imported ${bd}.tgz"
else
    echo "No OBS backend dump ${bd}.tgz found, ignoring."
fi
