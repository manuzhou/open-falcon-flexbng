#!/bin/bash

WORKDIR=$(cd $(dirname $0); pwd)

export GOPATH=$WORKDIR

cd $WORKDIR/src/github.com/open-falcon/falcon-plus/

make all;make pack

cp $WORKDIR/src/github.com/open-falcon/falcon-plus/open-falcon*.tar.gz $WORKDIR/

# packet all target
cd $WORKDIR
cp -r $WORKDIR/src/github.com/open-falcon/falcon-plus/scripts/mysql/db_schema .
tar -czvf open-falcon-target.tar.gz open-falcon-v*.tar.gz README.md db_schema/* 
rm open-falcon-v*.tar.gz
rm -rf db_schema
