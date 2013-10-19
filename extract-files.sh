#!/bin/sh

VENDOR=lge
DEVICE=vs980

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-blobs.txt | grep -v ^# | grep -v ^$ `; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    [ -e $REPOPATH/vendor/lge/g2/proprietary/$FILE ] && cp $REPOPATH/vendor/lge/g2/proprietary/$FILE $BASE/$FILE
#    adb pull /system/$FILE $BASE/$FILE
done

./setup-makefiles.sh
