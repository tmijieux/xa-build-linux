# build xamarin-android (AND xamarin-android apps!) on linux (with docker)

## TL;DR

1. ensure you have docker installed and setup and at least 32GB of free space in your home  
   (Note: the following assumes you can use the docker commandline with your regular user, that is to say, you are in the docker group)
2. `$ ./run.sh`
3. put your xamarin app in `myapp/src`, your xamarin android project directory must be named `[YourProjectName].Droid`
4. edit the APP variable in the myapp/build.sh script and replace `MyApp` with [YourProjectName]
5. `$ ./myapp/do_it.sh`
6. done! your apk is in `myapp/src/[YourProjectName].Droid/bin/Debug/`
7. You can install it on your android device with `adb install -r -d com.mycompany.myapp-Signed.apk`
