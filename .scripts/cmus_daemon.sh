#!/usr/bin/env bash
while :
do
	# Checks if cmus is running
	pgrep cmus
	if [ $? -eq 0 ]
	then
		# Checks whether its the same music playing
		PLAYING=<(cmus-remote -Q | sed -n -r "s/file\s//; s/\/home\/\w+\/Music\///; s/\.\w*$//;2p")
		sleep 1
		PLAYING_2=<(cmus-remote -Q | sed -n -r "s/file\s//; s/\/home\/\w+\/Music\///; s/\.\w*$//;2p")
		diff -q $PLAYING $PLAYING_2

		# Sends a notification if it's a different song
		if [ $? -eq 1 ]
		then
			notify-send "Now playing" "$(cmus-remote -Q | sed -n -r "s/file\s//; s/\/home\/\w+\/Music\///; s/\.\w*$//;2p")" -t 5000
		fi
	fi
done
