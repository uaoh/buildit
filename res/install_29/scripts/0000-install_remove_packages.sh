#!/bin/bash
set -eu

pacs_rm=(
    ruby2.1
)

pacs_in=(
    ca-certificates-mozilla
    obs-api
    obs-server
    obs-service-tar-git
    obs-worker
    obs-signd
    apache2
    apache2-mod_xforward
    rubygem-passenger-apache2
    memcached
)

cat <<EOF > /etc/zypp/repos.d/obs_server_mer-2.9_42.3.repo
[obs_server_2.9_mer]
name=obs:server:2.9:mer (openSUSE_42.3)
type=rpm-md
baseurl=http://repo.merproject.org/obs/obs:/server:/2.9:/mer/openSUSE_42.3/
gpgcheck=0
enabled=1
priority=49
EOF

cat <<EOF > /etc/zypp/repos.d/MINT.repo
[MINT (openSUSE_42.3)]
baseurl=http://repo.merproject.org/obs/mint/openSUSE_42.3/
enabled=1
gpgcheck=0
autorefresh=1
type=rpm-md
priority=69
EOF

cat <<EOF > /etc/zypp/repos.d/mer-infra_stable.repo
[Mer Infra stable (openSUSE_42.3)]
baseurl=http://repo.merproject.org/obs/mer-infra:/stable/openSUSE_42.3/
enabled=1
gpgcheck=0
autorefresh=1
type=rpm-md
priority=69
EOF

zypper ref
zypper up -y --no-recommends
zypper rm -y -u "${pacs_rm[@]}" || :
zypper in -y --no-recommends "${pacs_in[@]}"
