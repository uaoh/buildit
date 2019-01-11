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
    apache2
    apache2-mod_xforward
    rubygem-passenger-apache2
    memcached
)

cat <<EOF > /etc/zypp/repos.d/obs_server_mer-2.5_42.1.repo
[Mer OBS 2.5 on 42.1 (openSUSE_42.3)]
type=rpm-md
baseurl=http://repo.merproject.org/obs/obs:/server:/mer-2.5:/42.1/openSUSE_42.3/
gpgcheck=0
enabled=1
autorefresh=1
priority=69
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

for p in "${pacs_rm[@]}"
do
    zypper rm -y -u "${p}" || :
done

for p in "${pacs_in[@]}"
do
    zypper in -y --no-recommends "${p}"
done
