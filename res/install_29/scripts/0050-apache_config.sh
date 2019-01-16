#!/bin/bash
set -eu

PACS=(
    apache2
    apache2-mod_xforward
    rubygem-passenger-apache2
    memcached
)

for p in "${PACS[@]}"
do
    zypper --non-interactive in --no-recommends "${p}"
done

appendval()
{
    f="/etc/sysconfig/apache2"
    sed -rn 's@^\s*'"${1}"'\s*=\s*"([^"]*)"\s*$@\1@ p' "${f}" |
        grep -E '(^| )'"${2}"'($| )' && {
	echo "${0}: ${2} already in ${1}" >&2
        return
    }
    sed -ri 's@^\s*('"${1}"'\s*=\s*"[^"]*)"\s*$@\1 '"${2}"'"@' "${f}"
    echo "${0}: added ${2} in ${1}" >&2
}

appendval APACHE_MODULES passenger
appendval APACHE_MODULES rewrite
appendval APACHE_MODULES proxy
appendval APACHE_MODULES proxy_http
appendval APACHE_MODULES xforward
appendval APACHE_MODULES headers
appendval APACHE_MODULES socache_shmcb

appendval APACHE_SERVER_FLAGS SSL

sed -ri '
    s@^(\s*)Allow\s+from\s+all\s*$@\1Require all granted@
  ' /etc/apache2/vhosts.d/obs.conf

#sed -ri '
#    /[^a-zA-Z]Passenger(SpawnMethod|MaxPoolSize|MinInstances|PreStart)[^a-zA-Z]/ d
#  ' /etc/apache2/vhosts.d/obs.conf

sed -ri '
    s@^(\s*PassengerRuby\s+"/usr/bin/ruby)(".*)$@\1.ruby2.5\2@
  ' /etc/apache2/conf.d/mod_passenger.conf
