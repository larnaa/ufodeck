#!/bin/bash

echo "=> Setting environment"
export PINNED_CPUS=6-7,14-15
export ALL_CPUS=0-15

echo "=> Disabling hugepages"
sysctl vm.nr_hugepages=0
sysctl vm.nr_overcommit_hugepages=0

echo "=> Enabling power management"
for dev in `find /sys/devices -wholename "*power/control*"`; do
    echo $dev
    echo 'auto' | tee $dev;
done;

echo "=> Setting CPU governor"
cpupower frequency-set -g ondemand

echo "=> Unpinning existing processes"
ps axopid= | xargs -l taskset -pc $ALL_CPUS

echo "=> Unisolating CPU"
systemctl set-property --runtime -- user.slice AllowedCPUs=$ALL_CPUS
systemctl set-property --runtime -- system.slice AllowedCPUs=$ALL_CPUS
systemctl set-property --runtime -- init.scope AllowedCPUs=$ALL_CPUS
