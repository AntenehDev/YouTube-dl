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
	youtube-dl -i -f bestvideo+bestaudio -o '%(title)s.%(ext)s' "${url}"
	#youtube-dl -i -f best -o '%(title)s.%(ext)s' "${url}"
	#youtube-dl -i --extract-audio -x --embed-thumbnail --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s' "${url}"

done

