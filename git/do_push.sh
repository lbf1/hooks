#!/bin/sh
sub_path=$1

pushd `pwd`
cd $1
#only if there are no changes in the submodule
if git diff-files --quiet && git diff-index --cached --quiet HEAD;
then
	git push
	ret=$?
else
	echo error: submodule has uncommitted changes
	git status
	ret=1
fi
popd
exit $ret