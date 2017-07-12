#!/bin/bash
PREVDIR=$(pwd)
BASEDIR=$(cd "$(dirname "$0")/.."; pwd)
cd $BASEDIR/cordova-projects/$1
shift
cordova prepare
ANDROID_HOME=$HOME/Android/Sdk cordova build android $@
cd $PREVDIR
