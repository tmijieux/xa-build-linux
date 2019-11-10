# xamarin-android build on archlinux (with docker)

## TL;DR

1. ensure you have docker installed and setup and at least 32GB of free space in your home
2. $ ./run.sh
3. put your xamarin app in myapp/src, your xamarin android project directory must be named [YourProjectName].Droid
4. edit the APP variable in the myapp/build.sh script and replace MyApp with [YourProjectName]
5. $ ./myapp/do\_it.sh
6. done! your apk is in myapp/src/[YourProjectName].Droid/bin/Debug/

