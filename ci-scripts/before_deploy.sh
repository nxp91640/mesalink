#!/bin/bash

set -xev

if [ "$COV" != "yes" ] && [ "$CLIPPY" != "yes" ] && [ "$TRAVIS_RUST_VERSION" == "stable" ]
then
    mkdir -p $BUILD_SOURCESDIRECTORY/releases
    cd $BUILD_SOURCESDIRECTORY/inst
    tar -zcvf $BUILD_SOURCESDIRECTORY/releases/mesalink-$BUILD_SOURCEBRANCH-$ARCH.tar.gz *
    cd $BUILD_SOURCESDIRECTORY
fi
