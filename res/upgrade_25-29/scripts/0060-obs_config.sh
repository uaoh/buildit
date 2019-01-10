#!/bin/bash
set -eu

mkdir -p /srv/www/obs/api/log
chown -R wwwrun:www /srv/www/obs/api/log

mkdir -p /srv/www/obs/api/tmp
chown -R wwwrun:www /srv/www/obs/api/tmp

mkdir -p /run/passenger
chown -R wwwrun:www /run/passenger

mkdir -p /srv/obs/repos
chown -R obsrun:obsrun /srv/obs/repos

sed -ri '
          s@^[#[:space:]]*(use_xforward:)\s*.*@\1 true@
        ' /srv/www/obs/api/config/options.yml
sed -ri '
          s@^[#[:space:]]*(frontend_host:)\s*.*@\1 localhost@
        ' /srv/www/obs/api/config/options.yml
