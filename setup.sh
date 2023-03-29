#!/sbin/sh
#
# MMT Reborn Installation
# Rewritten by: Kartik728 <titanupdates728@gmail.com>
#

# Set permissions
set_permissions() { set_perm_recursive "$MODPATH" 0 0 0755 0644 ;}

# Info Print
info_print()
{
	ui_print ""
	awk '{print}' "$MODPATH/common/theorite-banner"
	ui_print ""
}

############
# Main
############

# Change the logic to whatever you want
main()
{
	info_print
	ui_print ""
	ui_print "[~] The THEORITE Project [~]"
	sleep 1
	ui_print ""
	ui_print "[*] Le'mme Gather Some Info About Your Device 🧐"
	ui_print ""
	sleep 0.5
	ui_print "[DEVICE]: $(getprop ro.product.model)"
	sleep 0.5
	ui_print "[BRAND]: $(getprop ro.product.system.brand)"
	sleep 0.5
	ui_print "[KERNEL]: $(uname -r)"
	sleep 0.5
	ui_print "[SoC]: $(getprop ro.product.board)"
	sleep 0.5
	ui_print ""

	set_permissions()
	{
		set_perm_recursive "$MODPATH" 0 0 0755 0644
		set_perm_recursive "$MODPATH/system" 0 0 0755 0644
	}
	sleep 1
	ui_print ""
	ui_print "[~] Trimming up Partitions..."
	fstrim -v /cache
	sleep 0.2
	fstrim -v /data
	sleep 0.2
	fstrim -v /product
	sleep 0.2
	fstrim -v /system
	sleep 0.2
	fstrim -v /vendor
	ui_print "[~] Trimmed up Partitions"
	ui_print ""
	sleep 1
	ui_print ""
	ui_print "[*] Initializing..."
	sleep 0.5
	mv "$MODPATH/tweaks" "$MODPATH/system.prop"
	sleep 0.5
	ui_print "[*] Initialized."
	ui_print ""
}

main
