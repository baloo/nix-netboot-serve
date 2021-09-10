#!/usr/bin/env nix-shell
#!nix-shell -i bash ../shell.nix

scratch=$(mktemp -d -t tmp.XXXXXXXXXX)
function finish {
  rm -rf "$scratch"
}
trap finish EXIT

while ! ip link show br0; do
  sleep 0
done

root_dir=$(realpath $(dirname $0)/../..)

RUST_LOG=example::api cargo run -- --gc-root-dir $root_dir/gc-roots --config-dir $root_dir/configurations --profile-dir $root_dir/profiles/ --cpio-cache-dir $root_dir/cpio-cache/ --listen 0.0.0.0:3030
