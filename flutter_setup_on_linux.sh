#!/bin/bash
# Flutter
cd ~/
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.5-stable.tar.xz -P ~/Downloads
mkdir -p ~/bin
tar -xf ~/Downloads/flutter_linux_3.19.5-stable.tar.xz -C ~/bin/
echo '# Flutter
export PATH=\"~jenkins/bin/flutter/bin:$PATH\"' > ~/.bash_profile
# android SDK
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -P ~/Downloads
unzip ~/Downloads/commandlinetools-linux-11076708_latest.zip -d ~/tmp/
mkdir -p ~/android-sdk/cmdline-tools/latest
mv ~/tmp/cmdline-tools/* ~/android-sdk/cmdline-tools/latest/
chown -R $(id -u):$(id -g) ~/android-sdk
echo '# JDK
JAVA_HOME=$(readlink -f /usr/bin/javac | sed \"s:/bin/javac::\")
export JAVA_HOME
PATH=$PATH:$JAVA_HOME/bin
export PATH
# android sdk
export ANDROID_HOME=${HOME}/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools/bin' >> ~/.bashprofile