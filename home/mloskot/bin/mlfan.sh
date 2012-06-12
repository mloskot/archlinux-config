#!/bin/sh
#
# Part of https://github.com/mloskot/archlinux-config
# Mateusz Loskot <mateusz@loskot.net>
#
# Original version by Mikito Takada
# http://blog.mixu.net/2012/01/19/how-to-thinkpad_acpi-and-fan-control-on-arch/
#
function fan() {
  # sensors
  echo level $@ | sudo tee /proc/acpi/ibm/fan
}

fan $@
