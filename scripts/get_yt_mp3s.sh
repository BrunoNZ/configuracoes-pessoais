#!/bin/bash

if [[ $# != 1 ]]; then
	echo "Parâmetros inválidos! Use:"
	echo "$ $0 [ARQUIVO_LISTA]"
	exit 1
fi

files=${1}


OPTS="--extract-audio --audio-format mp3 --audio-quality 5 --quiet "
youtubedl="python3 $(dirname ${0})/youtube-dl"

${youtubedl} --update

while read url; do
	${youtubedl} ${OPTS} ${url}
	if [ $? == 0 ]; then
		echo "OK: ${url}"
	else
		echo "ERROR: ${url}"
	fi
done < ${files}
