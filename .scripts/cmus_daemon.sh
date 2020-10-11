#!/usr/bin/env sh
get_status()
{
 cmus-remote -Q | sed -n -r "s/file\s//; s/\/home\/\w+\/Music\///; s/\.\w*$//;2p"
}

while :
do
	# Checks if cmus is running
	pgrep cmus
	if [ $? -eq 0 ]
	then
		# Checks whether its the same song playing
		PLAYING=<(get_status)
		sleep 1
		PLAYING_2=<(get_status)
		diff -q $PLAYING $PLAYING_2

		# Sends a notification if it's a different song
		if [ $? -eq 1 ]
		then
			SONG=$(get_status)
			echo $SONG | grep "set aaa_mode artist"
			if [ $? -ne 0 ] && [ "$SONG" != "" ]
			then
				dunstify --close=$CUR_SONG
				CUR_SONG=$(dunstify -u low -t 5000 "Now playing" "$SONG" --printid)
			fi
		fi
	fi
done
