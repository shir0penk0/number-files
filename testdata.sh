#!/bin/bash
if [ $# -ne 1 ]; then
  echo "please set number of files" 1>&2
  exit 1
fi

mkdir testdata
cd testdata
mkdir should_be_ignored_folder
for i in $(seq 1 ${1}); do
    touch "no_${i}"
done
