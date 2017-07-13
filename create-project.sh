#!/bin/bash
PREVDIR=$(pwd)
BASEDIR=$(cd "$(dirname "$0")"; pwd)
PROJECT=$1

if [ ! -d $BASEDIR/project-data/$PROJECT ]
then
    echo --------------------------------------
    echo Creating project data directory, initializing from audiowand
    rsync -ah $BASEDIR/audiowand/data/* $BASEDIR/project-data/$PROJECT
    echo Putting it under version control, you still need commit
    git add $BASEDIR/project-data/$PROJECT
fi

echo --------------------------------------
cd $BASEDIR/cordova-projects/
cordova create $PROJECT uk.org.rbge.hyam.audiowand.$PROJECT $PROJECT || exit 1
cd $PROJECT

echo --------------------------------------
echo Initializing www structure from template
rsync -ah --exclude-from $BASEDIR/audiowand/exclude_from_build.txt $BASEDIR/audiowand/* www
cp $BASEDIR/audiowand/config.xml www
rm config.xml
ln -s www/config.xml .
rm -fr www/data
ln -s $BASEDIR/project-data/$PROJECT www/data

echo --------------------------------------
echo Adding plugins ...
cordova plugin add \
        cordova-plugin-statusbar \
        cordova-plugin-media \
        cordova-plugin-splashscreen \
        cordova-plugin-background-audio \
        cordova-plugin-device \
        cordova-plugin-file \
        cordova-plugin-geolocation \
        cordova-plugin-inappbrowser@0.2.2 \

echo --------------------------------------
echo Adding platform, might take time, please be patient.
cordova platform add android

cd $PREVDIR
