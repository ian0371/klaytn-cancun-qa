#!/bin/bash

upgrade() {
	vals=$(ls -1d $ROOTDIR/output/cn* | wc -l)

	for i in $(seq 1 $vals); do
		pushd "$ROOTDIR/output/cn$i"
		ln -s $(which kcn) "$ROOTDIR/kcnd" bin/
		popd
	done
}
