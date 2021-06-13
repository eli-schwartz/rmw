#!/bin/sh

mkdir -p somefiles/topdir/dir1/dir2/dir3 || exit $?

c=1
while [ $c -lt 25 ]
do
   touch somefiles/topdir/dir1/dir2/dir3/$c
   c=`expr $c + 1`
done

touch somefiles/read_only_file &&
chmod ugo-w somefiles/read_only_file
