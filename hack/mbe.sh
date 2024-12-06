#!/usr/bin/env bash

# Source: https://gist.github.com/gmolveau/67d10dfaea1fdd729865b2f8d46f7488

function mbe() {
  if [ -f "$1" ]; then
    cat $1 | # print the file
    sed -n '/```bash/,/```/p' | # get the bash code blocks
    sed 's/```bash//g' | #  remove the ```bash
    sed 's/```//g' | # remove the trailing ```
    sed '/^$/d' | # remove empty lines
    /usr/bin/env sh ; # execute the command
  else
    echo "${1} is not valid" ;
  fi
}

mbe $1
