#!/bin/bash
set -eu

cd /srv/www/obs/api

cat <<EOF > config/database.yml
production:
  adapter: mysql2
  database: api_production
  username: obs
  password: skytree
  encoding: utf8
  timeout: 15
  pool: 30
EOF
chown root:www config/database.yml
chmod 0640 config/database.yml

# Adding our default archs. Maybe just write the whole configuration.xml?
sed -ri "
    s@(\['armv7l', )('i586', 'x86_64'\]\.each do \|arch_name\|)@\1'armv8el', \2@
  " db/seeds.rb

# TODO: drop me!
patch -p1 < <( sed -r 's@src/api/db/@db/@g' /host/0001-fix-structure.sql.patch )

RAILS_ENV="production" rake db:setup writeconfiguration ts:index ts:start
