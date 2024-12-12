#!/bin/sh
if [ $# != 1 ]; then
    echo "Usage example:"
    echo "  $0 esp32s3-scam/sdc_test"
    exit 1
fi
target=$1
cd nuttx
tools/configure.sh -E ${target}
make
cd -
