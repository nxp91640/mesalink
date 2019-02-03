#!/bin/bash

set -xev

# Only stable x86_64_macos and x86_64_linux builds run tests
if [[ x"$TARGET" == "x" ]]
then
    ./examples/client/client google.com
    RUST_BACKTRACE=1 cargo test
    ( cd bogo && ./runme )
fi
