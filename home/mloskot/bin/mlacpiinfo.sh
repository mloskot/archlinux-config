#!/bin/sh
echo "---acpi -V------------------------"
acpi -V
echo "---cat fan------------------------"
cat /proc/acpi/ibm/fan
echo "---cat thermal--------------------"
cat /proc/acpi/ibm/thermal
echo "---hddtemp------------------------"
sudo hddtemp /dev/sda
