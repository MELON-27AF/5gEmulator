#! /bin/bash -e

# start OVS
service openvswitch-switch start

sudo modprobe mac80211_hwsim

# check if docker socket is mounted
if [ ! -S /var/run/docker.sock ]; then
    echo 'Error: the Docker socket file "/var/run/docker.sock" was not found. It should be mounted as a volume.'
    exit 1
fi

echo "Welcome to Mininet-Wifi & Containernet running within a Docker container ..."

if [[ $# -eq 0 ]]; then
    exec /bin/bash
else
    exec $*
fi