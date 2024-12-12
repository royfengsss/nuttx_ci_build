#!/bin/sh
if [ $# != 1 ]; then
    echo "Usage example:"
    echo "  $0 esp32s3-scam/sdc_test"
    exit 1
fi
target=$1
git -C nuttx pull
git -C apps pull
cd nuttx
tools/configure.sh -E ${target}
make
cd -
