#!/bin/bash

WORKDIR=$(cd $(dirname $0); pwd)

export GOPATH=$GOPATH:$WORKDIR

cd $WORKDIR/src/github.com/open-falcon/falcon-plus/

make all;make pack

cp $WORKDIR/src/github.com/open-falcon/falcon-plus/open-falcon*.tar.gz $WORKDIR/
