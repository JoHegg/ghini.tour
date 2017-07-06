ghini.tour
====================

audio and geographic tour through a garden

idea
--------------------

we want to offer visitors something functionally similar to the audio tours that most musea, at least in Europe, offer.

you see a plate in the garden, grab the guide, type the number shown on the plate, you get to hear an explanation in your language.

realization
--------------------

we plan to use rogerhyam/audiowand

roadmap
--------------------

audiowand works on android,
android is mostly based on java and audiowand follows the guideline.

in order to just start setting up the development environment, you need to
download such a large amount of data that I never yet managed to find the
time to do it.

1. jdk
2. cordova
3. android

if you try to `cordova build android`, you get this::

    Error: Failed to find 'ANDROID_HOME' environment variable. Try setting setting it manually.
    Detected 'adb' command at /usr/bin but no 'platform-tools' directory found near.
    Try reinstall Android SDK or update your PATH to include valid path to SDK/platform-tools directory.
