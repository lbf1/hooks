#!/bin/sh
branch_name=$1
sub_path=$2

sub_index=`git rev-parse HEAD:$sub_path`
	
pushd `pwd`
cd $sub_path
#todo: don't assume submodule and parent repo branch names are the same
git checkout -B $branch_name $sub_index
popd