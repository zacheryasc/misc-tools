#!/bin/bash

base() {
	sudo apt update
	sudo apt install --assume-yes build-essential
	sudo apt install --assume-yes git clang curl libssl-dev llvm libudev-dev make protobuf-compiler gcc musl-dev tree
}

if (return 0 2>/dev/null); then
    echo sourced
else
    $@
fi