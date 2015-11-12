#!/bin/bash
# build for osx, linux and windows
# 
# run
# > ./buildAndZip.sh app
#
env GOOS=darwin GOARCH=amd64 go build
mv $1 $1_osx
env GOOS=linux GOARCH=amd64 go build
mv $1 $1_linux
env GOOS=windows GOARCH=amd64 go build
zip -r $1_bundle.zip $1_osx $1_linux $1.exe index.html
