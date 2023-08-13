#!/bin/bash
echo "=> Unbinding wlp4s0 from iwlwifi"
echo 0000:04:00.0 | tee /sys/bus/pci/drivers/iwlwifi/unbind

echo "=> Detaching wlp4s0"
virsh nodedev-detach pci_0000_04_00_0

echo "=> Unbinding enp6s0 from igb"
echo 0000:06:00.0 | tee /sys/bus/pci/drivers/igb/unbind

echo "=> Detaching enp6s0"
virsh nodedev-detach pci_0000_06_00_0
