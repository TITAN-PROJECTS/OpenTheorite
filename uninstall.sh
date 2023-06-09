#
# Uninstaller, simple MMT
# Written by UsiFX, pedrozzz0
#
# Copyright Identiter: GPL-3.0
# Copyright (C) 2023~2024 Kartik728 <titanupdates728@gmail.com>

# Don't modify anything after this
[[ -f "$INFO" ]] && {
	while read -r LINE; do
		if [[ "$(echo -n "$LINE" | tail -c 1)" == "~" ]]; then
			continue
		elif [[ -f "$LINE~" ]]; then
			mv -f "$LINE~" "$LINE"
		else
			rm -f "$LINE"
			while true; do
				LINE=$(dirname "$LINE")
				[[ "$(ls -A "$LINE" 2>/dev/null)" ]] && break 1 || rm -rf "$LINE"
			done
		fi
	done < "$INFO"
	rm -f "$INFO"
}
