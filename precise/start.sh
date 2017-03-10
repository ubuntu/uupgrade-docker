#!/bin/bash

if [ ! -z "${APT_PROXY}" ]; then
    echo "Acquire::http::Proxy \"${APT_PROXY}\";" > /etc/apt/apt.conf.d/20proxy
fi

apt-get update

# pin grub, resolvconf
PIN_PACKAGES="grub resolvconf"

if [ ! -z "${APT_PACKAGES}" ]; then
    echo "Installing apt packages..."
    apt-get install -y $APT_PACKAGES
fi

# Trusty package
#apt-get install -y ubuntu-release-upgrader-core

# Precise package
apt-get install -y update-manager-core python-apt

do-release-upgrade -f DistUpgradeViewNonInteractive

