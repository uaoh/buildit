#!/bin/bash
set -eu
sed -ri '
    :vh
        /^\s*<VirtualHost/ b dr
        n
        b vh
    :dr
        /^\s*DocumentRoot\s+.\/srv\/www\/obs\/api\/public.\s*$/ {
            p
            a \
        PassengerLogFile /srv/www/obs/api/log/passenger.log \
        PassengerLogLevel 4 \

            x
        }
        /^\s*<\/VirtualHost/ {
            n
            b vh
        }
        n
        b dr
' /etc/apache2/vhosts.d/obs.conf
