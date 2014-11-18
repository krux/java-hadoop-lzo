#!/bin/bash

set -xe

### The dir for the package script
MY_DIR=$( dirname $0 )
cd $MY_DIR

### The directory that the build is done in
TARGET=target/native/Linux-amd64-64/lib

### package name
PACKAGE_NAME=libgplcompression

### package version
PACKAGE_VERSION=$( date -u +%Y%m%d%H%M )

### List of files to package
FILES=.

### Where this package will be installed
DEST_DIR=/usr/lib

### Where the sources live
SOURCE_DIR="${MY_DIR}/${TARGET}"

# run fpm
/usr/local/bin/fpm -s dir -t deb -a all -n $PACKAGE_NAME -v $PACKAGE_VERSION --prefix $DEST_DIR -C $SOURCE_DIR --description 'Native gplcompression library for LZO' $FILES