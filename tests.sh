#!/bin/sh

set -e
for i in `ls tests/`;
do
    echo -n "$i: "
    hsh --rootpath . tests/$i
done