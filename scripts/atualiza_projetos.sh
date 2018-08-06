#!/bin/bash

projetos="
	lynx-eletrico
	lynx-eletrico-api
	lynx-eletrico-db
	lynx-energetico
	simulador
	hidrosim-mcsearch"

for proj in ${projetos}; do
    echo "#### GIT-PULL: ${proj} ####"
    (cd ./${proj} && git pull)
done

