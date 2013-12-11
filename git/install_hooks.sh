#!/bin/bash
my_path=`dirname $0`
files=$my_path/hooks/*
for f in $files
do
	dst="$my_path/../.git/hooks/`basename $f`"
	#echo $f $dst
	# if dst doesn't exist or it's not the same as the source, copy it
	if [ ! -e "$dst" ] || ! diff $f $dst >/dev/null ; then
		cp $f $dst
	fi
done