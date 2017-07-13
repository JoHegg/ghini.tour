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

* audiowand is a cordova based application,
* instructions on audiowand point you to the instructions on cordova,

* on Linux we can only compile Android applications,
* in order to compile Android applications, we need the Android SDK

- read `these instructions <https://developer.android.com/studio/install.html>`_
- download android studio 
- unpack it
- start it  
- be prepared to download 1G+ of more data

* Once you have installed Android Studio, you use it to download the Android SDK's.
* Tools -> Android -> SDK Manager

- decide which android versions you want to support. end of 2016 it's `still
  strongly advisable
  <http://www.androidpolice.com/2016/12/05/android-platform-distribution-december-2016-kitkat-is-finally-toppled-nougat-doesnt-move-much/>`_
  to support 4.4 (24%), while 4.1,2,3 form together more than 12% of the
  running devices. in July 2017 these figures went down to respectively
  18.1% and 8.8%.
- Android Studio puts the SDKs somewhere in your computer, check the
  location. for me, it was at ~/Android/Sdk. let ANDROID_HOME point here.
  
* cordova also needs gradle to be in the path. create a symlink
  ``/opt/android-studio/gradle/gradle-3.2/bin/gradle`` to ``/usr/local/bin``

- use the ``compile.sh`` script, it's basically ``cordova build android``,
  but for lazy people.

keeping track of tours
----------------------------

if you follow the original audiowand instructions, your tours will not be
under source control, and you will end with as many checkouts of the
audiowand sources as your tours. I don't think any of the two things to be
particularly desirable, and I suggest we do things slightly differently.

- you first create an ``audiowand`` checkout on the root directory, and do
  remember to ignore it. you can also symlink your existing checkout, if you
  prefer.

* initialize your ``project-data/<project>`` from ``audiowand/data/`` and
  put it under version control,
  
- use ``create-project <project>`` to:

  - create your cordova ``<project>`` under ``cordova-projects/``,
  - copy most of ``audiowand`` into ``cordova-projects/<project>/www``,
  - symlink ``project-data/<project>`` to ``cordova-projects/<project>/www/data``,

* ``compile.sh <project>`` will compile your project.
