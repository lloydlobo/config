#!/usr/bin/env bash

# https://gist.github.com/eduardoveiga/6478b342bc6408389b12fd8485485c49
for file in $(git ls-tree -r main --name-only | grep \\.go)

do
    echo "$file"
    output=$(gofmt -w "$file")

    # // test -d checks if a dir exists.
    # // test -n checks for?
    if test -n "$output"
    then
        echo >&2 "$output"
        exitcode=1
    fi

done
