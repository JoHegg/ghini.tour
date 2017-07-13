#!/bin/bash
PREVDIR=$(pwd)
BASEDIR=$(cd "$(dirname "$0")"; pwd)
PROJECT=$1
cd $BASEDIR/cordova-projects/$PROJECT
rsync -ah --exclude-from $BASEDIR/audiowand/exclude_from_build.txt $BASEDIR/audiowand/* www
shift
cordova prepare
ANDROID_HOME=$HOME/Android/Sdk cordova build android $@
cd $PREVDIR
