#!/bin/bash

git pull

./autogen.sh --prefix=/usr && sudo make install
