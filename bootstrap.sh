#!/bin/bash

base() {
	sudo apt update
	sudo apt install --assume-yes build-essential
	sudo apt install --assume-yes git clang curl libssl-dev llvm libudev-dev make protobuf-compiler gcc musl-dev tree
	
	# git config
	git config --global user.name "zacheryasc"
	git config --global user.email "zacheryasc@gmail.com"

}

rust-setup() {
  # rust base
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > $(pwd)/rustup.sh
	sh $(pwd)/rustup.sh -y
	rm $(pwd)/rustup.sh
	source $HOME/.cargo/env
}

fedimint() {
	rust-setup
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
	git clone git@github.com:fedimint/fedimint.git
	cd fedimint
	./scripts/bootstrap.sh
}

if (return 0 2>/dev/null); then
    echo sourced
else
    $@
fi
