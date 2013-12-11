#!/bin/sh
merge_head=$1
sub_path=$2

merge_sub=`git rev-parse $merge_head:$sub_path`

pushd `pwd`
cd $sub_path
#msysgit sets some environment variables which causes an error in git merge
#as a workaround, locally unset them
(
	unset GIT_DIR
	unset GIT_INDEX_FILE
	git merge $merge_sub
)
ret=$?
popd

#processing of foreach terminates on the first non-zero return value
exit $ret