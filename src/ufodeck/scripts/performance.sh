#!/bin/bash

echo "=> Setting environment"
export PINNED_CPUS=6-7,14-15
export ALL_CPUS=0-15

echo "=> Isolating CPU"
systemctl set-property --runtime -- user.slice AllowedCPUs=$PINNED_CPUS
systemctl set-property --runtime -- system.slice AllowedCPUs=$PINNED_CPUS
systemctl set-property --runtime -- init.scope AllowedCPUs=$PINNED_CPUS

echo "=> Pinning existing processes"
ps axopid= | xargs -l taskset -pc $PINNED_CPUS

echo "=> Setting CPU governor"
cpupower frequency-set -g performance

echo "=> Disabling power management"
for dev in `find /sys/devices -wholename "*power/control*"`; do
    echo $dev
    echo 'on' | tee $dev;
done;

echo "=> Enabling hugepages"
sysctl vm.nr_hugepages=512
sysctl vm.nr_overcommit_hugepages=4096
echo 3 > /proc/sys/vm/drop_caches
echo 1 > /proc/sys/vm/compact_memory
