#!/bin/bash
# build for osx, linux and windows and bundle
# 
# run to get zip
# > ./buildAndZip.sh app
# out : app.zip
#
# run to get tar
# > ./buildAndZip.sh app tar
# out : app.tar.gz

env GOOS=darwin GOARCH=amd64 go build
mv $1 $1_osx
env GOOS=linux GOARCH=amd64 go build
mv $1 $1_linux
env GOOS=windows GOARCH=amd64 go build

if [ $2 = "tar" ]; then
  tar -cvf $1_bundle.tar.gz $1_osx $1_linux $1.exe 
else
  zip -r $1_bundle.zip $1_osx $1_linux $1.exe
fi
