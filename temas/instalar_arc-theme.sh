#!/bin/bash

git pull

./autogen.sh --prefix=/usr --disable-transparency && sudo make install

