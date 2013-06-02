#!/bin/sh
#
# Stefan Huber <shuber2@gmail.com>
# Displays some temperature info


if [ -e /proc/acpi/ibm ]
then
	info=`cat /proc/acpi/ibm/thermal | sed "s/^.*://" `

	#1  ??, THM0, strongly reacts on heat at the cooling gills. reacts on cpu
	#2  DVD: reacts on heat at the dvd drive
	#3  express card: 31°C  REACTS ON HEAT ON PC-CARD SLOT
	#4  agp, gets active when switched to discrete graphics, reacts on load
	#5  disappears when bat0 is plugged off --> ~50°C always
	#6  thinkwiki thinks this is for bat1
	#7  disappears when bat0 is plugged off --> ~val of bat temp through smapi
	#8  thinkwiki thinks this is for bat1 	
	#9  hdd: 33°C  REACTS ON HEAD AT THE HARD DISC AREA 
	#10 igp, reacts on gtkperf
	#11 heatsink? slowly reacts on heat at cooling gill. slowly reacts on cpu

	cpusocket=`echo $info | awk ' { print $1 } '`
	dvd=`echo $info | awk ' { print $2 } '`
	excard=`echo $info | awk ' { print $3 } '`
	atigpu=`echo $info | awk ' { print $4 } '`
	hdd=`echo $info | awk ' { print $9 } '`
	intelgpu=`echo $info | awk ' { print $10 } '`
	heatsink=`echo $info | awk ' { print $11 } '`

	#No equivalent in $info!! Reacts more directly to load than thm0. Due
	#to acpi info, this is cpu.
	cpu=`cat /proc/acpi/thermal_zone/THM1/temperature | awk ' { print $2 } '`

	echo -n "cpu:$cpu°C cpus:$cpusocket°C"

	if [ $intelgpu != "-1" ]; then
		echo -n " igp:$intelgpu°C"
	fi

	if [ $atigpu != "-1" ]; then
		echo -n " agp:$atigpu°C"
	fi

	echo ""
	echo "hs:$heatsink°C ec:$excard°C hdd:$hdd°C dvd:$dvd°C"
else
	mb=`cat /proc/acpi/thermal_zone/THM0/temperature | awk ' { print $2 } '`
	cpu=`cat /proc/acpi/thermal_zone/THM1/temperature | awk ' { print $2 } '`

	echo "cpu: $cpu°C mb: $mb°C"
fi




