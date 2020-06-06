#!/bin/bash
DIGITS=$((`ls -F | grep -v / | wc -l` / 10 + 2))

order(){
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

order | rename