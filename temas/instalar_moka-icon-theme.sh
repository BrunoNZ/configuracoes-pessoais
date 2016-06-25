#!/bin/bash

git pull

bash autogen.sh --prefix=/usr && make && sudo make install
