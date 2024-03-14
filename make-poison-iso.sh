#!/bin/sh
#=================================================================#
# Gen iso POISON GNU/Linux /tmp/
#=================================================================#

cd ..
mkisofs -o /tmp/poison64-1.0-stable.iso \
    -R -J -V "Poison GNU/Linux" \
    -hide-rr-moved -hide-joliet-trans-tbl \
    -v -d -N -no-emul-boot -boot-load-size 4 -boot-info-table \
    -sort isolinux/iso.sort \
    -b isolinux/isolinux.bin \
    -c isolinux/isolinux.boot \
    -preparer "Poison GNU/Linux build for x86_64 by Jefferson Carneiro <slackjeff@riseup.net>" \
    -publisher "The Poison GNU/Linux Project." \
    -A "Poison GNU/linux - build 08_Mar_2024" \
    -x ./pasture -x ./testing  -x ./source -x ./extra/source -x ./sunflower -x ./patches -x ./.htaccess -x ./HEADER.html \
    -eltorito-alt-boot -no-emul-boot -eltorito-platform 0xEF -eltorito-boot isolinux/efiboot.img \
    .
