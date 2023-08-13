#!/bin/bash
echo "=> Attaching wlp4s0"
virsh nodedev-reattach pci_0000_04_00_0

echo "=> Binding wlp4s0 to iwlwifi"
echo 0000:04:00.0 | tee /sys/bus/pci/drivers/iwlwifi/bind

echo "=> Attaching enp6s0"
virsh nodedev-reattach pci_0000_06_00_0

echo "=> Binding enp6s0 to igb"
echo 0000:06:00.0 | tee /sys/bus/pci/drivers/igb/bind
