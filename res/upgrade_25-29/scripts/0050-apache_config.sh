#!/bin/bash
set -eu

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

## see https://bz.apache.org/bugzilla/show_bug.cgi?id=58498
# sed -ri '
#     s@^(\s*APACHE_MODULES\s*=\s*)(("[^"]+\s+)|("\s*))autoindex((\s+[^"]+\s*"|\s*"))@\1\2\5@
#   ' /etc/sysconfig/apache2
zypper ar http://ftp5.gwdg.de/pub/opensuse/discontinued/distribution/leap/42.1/repo/oss/ leap_42.1
zypper ref
zypper in -y --oldpackage apache2-2.4.16-7.1.x86_64 apache2-prefork-2.4.16-7.1.x86_64

## see https://bz.apache.org/bugzilla/show_bug.cgi?id=59842
# systemctl stop apache2
# systemctl start apache2
