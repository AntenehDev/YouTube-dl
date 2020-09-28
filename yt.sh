#!/bin/bash
for pkg in ffmpeg python youtube-dl 
do
	if pacman -Qs $pkg > /dev/null; then
		echo "$pkg installed"
	else
		echo "$pkg not installed"
		sudo pacman -S $pkg
	fi
done

while true
do
	echo 'Hit q to quit else URL: '
	read url
	if [[ $url = q ]]
	then
		exit
	fi
	youtube-dl -f bestvideo+bestaudio -o '%(title)s.%(ext)s' "${url}"
	#youtube-dl -f best -o '%(title)s.%(ext)s' "${url}"
done

