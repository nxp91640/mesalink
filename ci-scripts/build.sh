#!/bin/bash

set -xev

# Skip building MesaLink if testing for coverage only
if [[ "$COVERAGE" == "yes" ]]
then
    exit 0
fi

if [[ x"$TARGET" == "x" ]]
then
    ./autogen.sh --enable-examples
else
    rustup target add $RUST_TARGET
    ./autogen.sh --host=$TARGET --enable-rusthost=$RUST_TARGET
fi

make
make DESTDIR=$BUILD_SOURCESDIRECTORY/inst install-strip
du -sh $BUILD_SOURCESDIRECTORY/inst/usr/local/lib/libmesalink.*

