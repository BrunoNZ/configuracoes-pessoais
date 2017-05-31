#!/bin/bash

ARC_PKG_URL="https://github.com/horst3180/arc-theme/archive/master.zip"

TMP_DIR="/tmp/bnzanette/"
THEMES_DIR="${TMP_DIR}/theme-files"
PKG_DIR="${TMP_DIR}/arc-theme-master"

exit_error()
{
    echo "ERROR! ${1}";
    exit 1
}

GNOME_VERSION="3.18"
COMPILE_OPTS="
--prefix ${THEMES_DIR}
--disable-transparency
--disable-gnome-shell
--disable-unity
--disable-xfwm
--with-gnome=${GNOME_VERSION}
"

echo "* Downloading ArcTheme..."
if [[ ($(wget -q ${ARC_PKG_URL} -P ${TMP_DIR}; echo $?) == 0)
        && (-f ${TMP_DIR}/master.zip) ]]; then

    echo "* Unpacking package file..."
    unzip -o -qq ${TMP_DIR}/master.zip -d ${TMP_DIR} \
        || exit_error "Something went wrong."

    echo "* Compiling theme..."
    (cd ${PKG_DIR} && ./autogen.sh ${COMPILE_OPTS} &> /dev/null) \
        || exit_error "Something went wrong."

    echo "* Installing theme..."
    (cd ${PKG_DIR} && make install &> /dev/null) \
        || exit_error "Something went wrong."

    echo "* Moving theme to ~/.themes ..."
    rsync -r -u ${THEMES_DIR}/share/themes/Arc-* ${HOME}/.themes/ \
        || exit_error "Something went wrong."

    echo "* Cleaning..."
    (cd ${TMP_DIR} && \
        rm -r $(basename ${PKG_DIR}) $(basename ${THEMES_DIR}) master.zip)
fi
