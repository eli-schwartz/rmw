#!/bin/sh

set -ev

EXT=$(echo "${1}"|awk -F . '{print $NF}')
echo ": ${1}"

if test "$EXT" = ".sh"; then
  export VALGRIND=valgrind --error-exitcode=1 --leak-check=full
  ${1}
else
  valgrind --error-exitcode=1 --leak-check=full ${1}
fi
