ghini.tour
====================

Garden data for audio guide and geographic tour. This projects holds:

* instructions on how to produce and distribute an audio guide based on
  rogerhyam/audiowand.
* the data that describe each garden.

Idea
--------------------

A ghini.tour offers visitors something functionally similar to the audio
guides offered at the entrance of most modern musea.

Each guide is a separate "app", you download it from the garden portal to
your android phone, you install it, use it during your visit, you probably
will remove it after you leave the garden.

The guides offer spoken text associated to spots in the garden, a detailed
map of the garden on which you can see your approximate position, if your
phone has a GPS sensor, and that's about it.

How to install it
--------------------

The author of audiowand seems to have enough experience with mobile
applications, that he's explaining little to nothing, because all is obvious
to you if you also have some experience with mobile applicaitons.  Since I
had none, and I have bad memory, I'm going to explain the obvious.

* audiowand works on android,
* android is mostly based on java,
* instructions on audiowand point you to the instructions on cordova,
* cordova is a java application,

* on Linux we can only compile Android applications,
* in order to compile Android applications, we need the Android SDK

- read `these instructions <https://developer.android.com/studio/install.html>`_
- download android studio 
- unpack it
- start it  
- be prepared to download 1G+ of more data

- Once you have installed Android Studio, you use it to download the Android SDK's.
- Tools -> Android -> SDK Manager

- decide which android versions you want to support. end of 2016 it's `still
  strongly advisable
  <http://www.androidpolice.com/2016/12/05/android-platform-distribution-december-2016-kitkat-is-finally-toppled-nougat-doesnt-move-much/>`_
  to support 4.4 (24%), while 4.1,2,3 form together more than 12% of the
  running devices. in July 2017 these figures went down to respectively
  18.1% and 8.8%.
- Android Studio puts the SDKs somewhere in your computer, check the
  location. for me, it was at ~/Android/Sdk. let ANDROID_HOME point here.
  
- cordova also needs gradle to be in the path. create a symlink
  ``/opt/android-studio/gradle/gradle-3.2/bin/gradle`` to ``/usr/local/bin``

- start ``cordova build android`` and be prepared to wait. the first run might take 20 minutes.
- start ``cordova build android --release`` when your tour is ready to be released.

keeping track of tours
----------------------------

if you follow the current audiowand instructions, your tours will not be
under source control, and you will end with as many checkouts of the
audiowand sources as your tours. both things are not particularly desirable,
and I suggest we do things slightly differently.

- copy the ``audiowand/data`` directory as ``project-data/<project>``,
- put ``project-data/<project>`` under version control,
- create your cordova ``<project>`` under ``cordova-projects/``,
- symlink ``project-data/<project>`` to ``cordova-projects/<project>/www/data``,
- use the ``compile.sh`` script to compile a project,
