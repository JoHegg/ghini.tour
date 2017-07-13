#!/bin/bash
PREVDIR=$(pwd)
BASEDIR=$(cd "$(dirname "$0")"; pwd)
PROJECT=$1
cd $BASEDIR/cordova-projects/
cordova create $PROJECT uk.org.rbge.hyam.audiowand.$PROJECT $PROJECT
cd $PROJECT
ln -s $BASEDIR/audiowand .
ln -s audiowand/update_core.sh .
rsync -ah --exclude-from 'audiowand/exclude_from_build.txt' audiowand/* www
cp audiowand/config.xml www
rm config.xml
ln -s www/config.xml .
rm -fr www/data
ln -s $BASEDIR/project-data/$PROJECT www/data
cordova plugin add cordova-plugin-background-audio@1.0.0
cordova plugin add cordova-plugin-device@1.0.1
cordova plugin add cordova-plugin-file@3.0.0
cordova plugin add cordova-plugin-geolocation@1.0.1
cordova plugin add cordova-plugin-inappbrowser@1.0.1
cordova plugin add cordova-plugin-media@1.0.1
cordova plugin add cordova-plugin-splashscreen@2.1.0
cordova plugin add cordova-plugin-statusbar@1.0.1
echo adding platform, will take time, please be patient.
cordova platform add android
cd $PREVDIR
