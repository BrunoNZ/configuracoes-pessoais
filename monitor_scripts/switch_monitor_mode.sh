# !/bin/bash
INPUT_TYPE="${1}"
CONFIGS_DIR="$(dirname ${0})/configs"

echo ${INPUT_TYPE}
case $INPUT_TYPE in
    pc120hz)      CONFIG_FILE=${CONFIGS_DIR}/pc120hz.xml ;;
    pc2monitors)  CONFIG_FILE=${CONFIGS_DIR}/pc2monitors.xml ;;
    tv4k)         CONFIG_FILE=${CONFIGS_DIR}/tv4k.xml ;;
    tv4k)         CONFIG_FILE=${CONFIGS_DIR}/tv2k.xml ;;
    *) exit 1 ;;
esac

if [ ! -f ${CONFIG_FILE} ]; then
    exit 1
fi

cp ${CONFIG_FILE} ${HOME}/.config/cinnamon-monitors.xml
nohup cinnamon --replace &
