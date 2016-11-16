#!/bin/bash

set -e

OPEN_LINK_LTSV=~/.open-link.ltsv

link="$(
cat "$OPEN_LINK_LTSV" \
    | cut -d$'\t' -f1 \
    | cut -d: -f2 \
    | fzy
)"

if [[ -z $link ]]; then
    exit 0
fi

link="$(
cat "$OPEN_LINK_LTSV" \
    | grep "name:$link" \
    | cut -d$'\t' -f2 \
    | sed 's/^link://'
)"

if [[ -z $link ]]; then
    echo "failed to open link" >&2
    exit 1
fi

open "$link"
