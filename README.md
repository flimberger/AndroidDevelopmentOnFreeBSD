Preparation:
```
pkg install openjdk8
pkg install linux_base-c7
```
Now download the sdk commandline tools and unpack them.
Set the environment variable `ANDROID_SDK_HOME` to the extracted directory,
and the environment `REPO_OS_OVERRIDE` to `linux`.
Install the build tools,
```
./tools/bin/sdkmanager --install 'build-tools;28.0.3'
./tools/bin/sdkmanager --install 'platforms;android-28'
touch $HOME/.android/repositories.cfg
```
Run the `brandtools.sh` script.
Test with
```
LD_LIBRARY_PATH=$ANDROID_SDK_ROOT/build-tools/28.0.3/lib64 ./build-tools/28.0.3/aapt`
```
Optional:
Add the required `buildToolsVersion` to the `build.gradle` because default seems to be `28.0.2`.
This should probably be downloaded in the first step,
but I didn't test it that way.

The build now fails with AAPT2,
which does check for the OS and doesn't support FreeBSD.
The option `android.enableAapt2=false` is deprecated and ignored,
while `android.useAapt2FromMaven=false` doesn't cover all necessary code-paths in the gradle plugin which check for the OS.
