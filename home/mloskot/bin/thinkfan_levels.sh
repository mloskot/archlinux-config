#!/bin/sh
for i in 0 1 2 3 4 5 6 7;
do
	echo "level $i" > /proc/acpi/ibm/fan
	echo "level $i..."
	sleep 6
	cat /proc/acpi/ibm/fan | egrep "^speed"
	echo
done
