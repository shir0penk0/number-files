#!/bin/bash
if [ $# -ne 1 ]; then
  echo "please set a target directory" 1>&2
  exit 1
fi

cd $1
DIGITS=$((`ls -F | grep -v / | wc -l` / 10 + 2))

get_sorted_filenames(){
    ls -F -tr | grep -v /
}

rename(){
    local count=0
    while read -r line
    do
        count=$((count+1))
        echo "${line} -> `printf %0*d $DIGITS $count`_${line}"
        mv $line "`printf %0*d $DIGITS $count`_${line}"
    done
}

get_sorted_filenames | rename