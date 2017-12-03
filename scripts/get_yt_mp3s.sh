#!/bin/bash

files=${1}

OPTS="--extract-audio --audio-format mp3 --audio-quality 5 --quiet "

while read url; do
	youtube-dl ${OPTS} ${url}
	if [ $? == 0 ]; then
		echo "OK: ${url}"
	else
		echo "ERROR: ${url}"
	fi
done < ${files}
