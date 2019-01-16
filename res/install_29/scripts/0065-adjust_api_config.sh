#!/bin/bash
set -eu

sed -ri '
    s@^[#[:space:]]*(frontend_host:)\s*.*@\1 localhost@
    s@^[#[:space:]]*(frontend_port:)\s*.*@\1 443@
    s@^[#[:space:]]*(frontend_protocol:)\s*.*@\1 https@
  ' /srv/www/obs/api/config/options.yml
