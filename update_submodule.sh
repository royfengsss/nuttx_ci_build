#!/bin/bash

REV_OLD_NUTTX=$(sed -n '1p' revision.txt)
REV_OLD_APPS=$(sed -n '2p' revision.txt)

git -C nuttx pull
git -C apps pull

REV_NEW_NUTTX=$(git -C nuttx/ rev-parse)
REV_NEW_APPS=$(git -C apps/ rev-parse)

if [[ ${REV_OLD_NUTTX} != ${REV_NEW_NUTTX} && ${REV_OLD_APPS} !=  ${REV_NEW_APPS} ]]; then
    touch revision.txt
    echo ${REV_NEW_NUTTX} > revision.txt
    echo ${REV_NEW_APPS} >> revision.txt
fi
