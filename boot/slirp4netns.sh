#!/bin/sh

set -eux

ENVID=oogabooga
ident='sh -c sleep infinity; echo "'"$ENVID"'"'

while ! pgrep -xf "$ident"; do
  sleep 0.4
done

pid=$(pgrep -xf 'sh -c sleep infinity; echo "'"$ENVID"'"')

sleep 1; #don't ask me

slirp4netns "$pid" tap42
