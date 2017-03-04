#!/bin/bash

ATOM_DEB_URL="https://atom.io/download/deb"
ATOM_DEB_FILE="/tmp/atom.deb"
ATOM_INSTALL_FOLDER="/home/ppginf/bnzanette/nobackup/atom"

exit_error()
{
    echo "ERROR! ${1}"; 
    exit 1    
}


if [[ $(pgrep -c -x "atom") > 0 ]]; then
    exit_error "Close all Atom instances and retry."
fi

echo "* Downloading Atom..."
if [[ ($(wget -q ${ATOM_DEB_URL} -O ${ATOM_DEB_FILE}; echo $?) == 0)
        && (-f ${ATOM_DEB_FILE}) ]]; then

    echo "* Creating installation folder..."
    mkdir -p ${ATOM_INSTALL_FOLDER} || exit_error "Something went wrong."

    echo "* Cleaning installation folder..."
    (cd ${ATOM_INSTALL_FOLDER} && rm -rf usr) || exit_error "Something went wrong."

    echo "* Unpacking deb file..."
    dpkg -x ${ATOM_DEB_FILE} ${ATOM_INSTALL_FOLDER} || exit_error "Something went wrong."
    
    echo "* Cleaning temporary files..."
    rm ${ATOM_DEB_FILE}
fi

echo -e "* DONE!"
exit 0
