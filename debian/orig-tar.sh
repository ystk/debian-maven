#!/bin/sh -e

VERSION=$2
TAR=../maven_$VERSION.orig.tar.xz
DIR=maven-$VERSION
TAG=$(echo maven-$VERSION | sed s/~RC/-RC/ )

rm $3

git clone http://git.apache.org/maven.git $DIR
cd $DIR
git checkout tags/$TAG
cd ..
rm -Rf $DIR/.git

XZ_OPT=--best tar -c -J -f $TAR -X debian/orig-tar.exclude $DIR
rm -rf $DIR ../$TAG
