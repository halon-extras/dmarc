#!/bin/sh

set -e
for i in `ls tests/`;
do
    hsh --rootpath . tests/$i
done