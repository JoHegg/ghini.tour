#!/bin/bash
PREVDIR=$(pwd)
BASEDIR=$(cd "$(dirname "$0")/.."; pwd)
PROJECT=$1
cd $BASEDIR/cordova-projects/
cordova create $PROJECT me.ghini.mfrasca.audiowand.$PROJECT $PROJECT
cd $PROJECT
cordova plugin add cordova-plugin-background-audio@1.0.0
cordova plugin add cordova-plugin-device@1.0.1
cordova plugin add cordova-plugin-file@3.0.0
cordova plugin add cordova-plugin-geolocation@1.0.1
cordova plugin add cordova-plugin-inappbrowser@1.0.1
cordova plugin add cordova-plugin-media@1.0.1
cordova plugin add cordova-plugin-splashscreen@2.1.0
cordova plugin add cordova-plugin-statusbar@1.0.1 
cordova platform add android
cd $PREVDIR
