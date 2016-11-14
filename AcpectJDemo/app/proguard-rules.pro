# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in D:\Android SDK\Android SDK/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
-dontshrink                         #不压缩输入的类文件
-ignorewarnings                     # 忽略警告，避免打包时某些警告出现
-optimizationpasses 5               #指定代码的压缩级别
-dontusemixedcaseclassnames         #包明不混合大小写
-dontskipnonpubliclibraryclasses    #不去忽略非公共的库类jar
-dontskipnonpubliclibraryclassmembers
-dontoptimize                       #优化  不优化输入的类文件
-dontpreverify                      #预校验
-verbose                            #混淆时是否记录日志
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*  # 混淆时所采用的算法
-keepattributes *Annotation*        #保护注解
-keepattributes *JavascriptInterface*
-keepattributes Signature
-keepattributes Exceptions
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
-printmapping mapping.txt

-dontwarn android.os.**
-dontwarn android.support.v4.**     #缺省proguard 会检查每一个引用是否正确，但是第三方库里面往往有些不会用到的类，没有正确引用。如果不配置的话，系统就会报错。
-dontwarn android.support.v7.**
-dontwarn android.support.v8.**
-dontwarn android.support.design.**
-dontwarn android.os.**
-dontwarn android.text.**
-dontwarn android.webkit.WebView
-dontwarn com.alibaba.fastjson.**
-dontwarn com.wallstreetcn.meepo.**
-dontwarn com.nostra13.universalimageloader.**
-dontwarn com.squareup.okhttp.**
-dontwarn okio.**
-dontwarn com.facebook.stetho.**

-keep class android.support.v4.** { *; }        # 保持哪些类不被混淆
-keep class android.support.v7.** { *; }        # 保持哪些类不被混淆
-keep class android.support.v8.** { *; }        # 保持哪些类不被混淆
-keep class android.support.design.** { *; }        # 保持哪些类不被混淆
-keep class android.text.** {*;}
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.support.v4.widget
-keep interface android.support.v4.app.** { *; }
-keep class com.trello.**{*;}
-keep class com.wallstreetcn.meepo.bean.**{*;}
-keep class com.alibaba.fastjson.**{*;}
-keep class com.sina.**{*;}
-keep class com.squareup.okhttp.**{*;}
-keep class okio.** {*;}
-keep class com.squareup.wire.** {*;}
-keep class com.facebook.stetho.**{*;}
-keep class org.apache.**{*;}
-keep class org.android.**{*;}
-keep class com.r0adkll.slidr.**{*;}
-keep class org.apache.**{*;}

-keep class com.alexvasilkov.gestures.**{*;}
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
    **[] $VALUES;
    public *;
}


#把[您的应用包名] 替换成您自己的包名，如"com.example.R$*"。
-keep public class com.lisao.acpectjdemo.R$*{
    public static final int *;
}
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.com.wallstreetcn.library.util.AttributeSet);
    public <init>(android.content.Context, android.com.wallstreetcn.library.util.AttributeSet, int);
    public void set*(...);
}
-keepclasseswithmembernames class * {  # 保持 native 方法不被混淆
    native <methods>;
}
-keepclasseswithmembers class * {      # 保持自定义控件类不被混淆
    public <init>(android.content.Context, android.com.wallstreetcn.library.util.AttributeSet);
}
-keepclassmembers class * extends android.app.Activity { #所有activity的子类不要去混淆
   public void *(android.view.View);
}

-keepclassmembers enum * {
   public static **[] values();
   public static ** valueOf(java.lang.String);
}
-keepclassmembers class ** {
    public void onEvent*(**);
}

-keepclassmembers class * {
   public <init>(org.json.JSONObject);
}
# Only required if you use AsyncExecutor
-keepclassmembers class * extends de.greenrobot.event.com.wallstreetcn.library.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}


-adaptclassstrings
-keepattributes InnerClasses, EnclosingMethod, Signature, Annotation

-keepnames @org.aspectj.lang.annotation.Aspect class * {
ajc* <methods>;

}