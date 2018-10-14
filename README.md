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
touch $HOME/.android/repositories.cfg
```
Run the `brandtools.sh` script.
Test with
```
LD_LIBRARY_PATH=$ANDROID_SDK_ROOT/build-tools/28.0.3/lib64 ./build-tools/28.0.3/aapt`
```
This works already,
but the gradle plugin fails:
```
Caused by: java.lang.IllegalStateException: Failed to find Build Tools revision 28.0.2
        at com.android.builder.sdk.DefaultSdkLoader.installBuildTools(DefaultSdkLoader.java:302)
        at com.android.builder.sdk.DefaultSdkLoader.getTargetInfo(DefaultSdkLoader.java:155)
        at com.android.build.gradle.internal.SdkHandler.initTarget(SdkHandler.java:183)
        at com.android.build.gradle.BasePlugin.ensureTargetSetup(BasePlugin.java:980)
        at com.android.build.gradle.BasePlugin.createAndroidTasks(BasePlugin.java:752)
        at com.android.build.gradle.BasePlugin.lambda$null$4(BasePlugin.java:690)
        at com.android.builder.profile.ThreadRecorder.record(ThreadRecorder.java:81)
        at com.android.build.gradle.BasePlugin.lambda$createTasks$5(BasePlugin.java:686)
        at org.gradle.internal.event.BroadcastDispatch$ActionInvocationHandler.dispatch(BroadcastDispatch.java:91)
        at org.gradle.internal.event.BroadcastDispatch$ActionInvocationHandler.dispatch(BroadcastDispatch.java:80)
        at org.gradle.internal.event.AbstractBroadcastDispatch.dispatch(AbstractBroadcastDispatch.java:42)
        at org.gradle.internal.event.BroadcastDispatch$SingletonDispatch.dispatch(BroadcastDispatch.java:230)
        at org.gradle.internal.event.BroadcastDispatch$SingletonDispatch.dispatch(BroadcastDispatch.java:149)
        at org.gradle.internal.event.AbstractBroadcastDispatch.dispatch(AbstractBroadcastDispatch.java:58)
        at org.gradle.internal.event.BroadcastDispatch$CompositeDispatch.dispatch(BroadcastDispatch.java:324)
        at org.gradle.internal.event.BroadcastDispatch$CompositeDispatch.dispatch(BroadcastDispatch.java:234)
        at org.gradle.internal.event.ListenerBroadcast.dispatch(ListenerBroadcast.java:140)
        at org.gradle.internal.event.ListenerBroadcast.dispatch(ListenerBroadcast.java:37)
        at org.gradle.internal.dispatch.ProxyDispatchAdapter$DispatchingInvocationHandler.invoke(ProxyDispatchAdapter.java:93)
        at com.sun.proxy.$Proxy27.afterEvaluate(Unknown Source)
        at org.gradle.configuration.project.LifecycleProjectEvaluator.notifyAfterEvaluate(LifecycleProjectEvaluator.java:76)
        ... 81 more
```
