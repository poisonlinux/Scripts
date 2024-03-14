#!/bin/sh
#==========================================================================#
# Open initrd.img and close.
# Created by jefferson carneiro <slackjeff@riseup.net>
#==========================================================================#
set -e
#==========================================================================#

DIE() {
    message="$@"
    printf "$@"
    exit 1
}

HELP()
{
    echo "$(basename $0) -o,--open,open"
    echo "$(basename $0) -g,--generate,generate"
    exit 0
}

INITRD_OPEN()
{
    [ -d "INITRD" ] && DIE "INITRD directory exist."
    [ ! -e "initrd.img" ] && DIE "initrd.img not found."
    mkdir INITRD
    cd INITRD
    xz -dc <../initrd.img | cpio --quiet -i --make-directories
}

INITRD_CLOSE()
{
    cd INITRD
    find . | cpio -o -H newc | xz -9fv -C crc32 > ../initrd.img
}

case $1 in
    -o|open|--open) INITRD_OPEN ;;
    -g|generate|--generate) INITRD_CLOSE ;;
    *) HELP ;;
esac
