#!/system/bin/sh
#
# Service Runner, Simple MMT
#
# Copyright Identiter: GPL-3.0
# Copyright (C) 2023~2024 Kartik728 <titanupdates728@gmail.com>
#

modpath="/data/adb/modules/theorite.magisk"

# Wait to boot be completed
until [[ "$(getprop sys.boot_completed)" -eq "1" ]] || [[ "$(getprop dev.bootcomplete)" -eq "1" ]]; do
	sleep 1
done
