# !/bin/bash
INPUT_TYPE="${1}"
CONFIGS_DIR="$(dirname ${0})/configs"

CONFIG_FILE=${CONFIGS_DIR}/${INPUT_TYPE}.xml

if [ ! -f ${CONFIG_FILE} ]; then
    exit 1
fi

cp ${CONFIG_FILE} ${HOME}/.config/cinnamon-monitors.xml
nohup cinnamon --replace &
