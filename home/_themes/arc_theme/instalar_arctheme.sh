#!/bin/bash

WORKDIR=$(pwd)

git pull

./autogen.sh \
	--prefix=${WORKDIR}/ArcTheme-Compiled \
	--disable-transparency \
&& make install

echo -e "--------------------------------------------------------------"
echo -e "Ok! Agora execute:"
echo -e "sudo cp -r ArcTheme-Compiled/share/themes/* /usr/share/themes/"
echo -e "--------------------------------------------------------------"

