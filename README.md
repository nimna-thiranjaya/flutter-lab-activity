# Create flutter-lab-activity

In terminal run this command to create project ``` flutter create lab_activity_saturday ```.

Flutter project directory, run this command to install the firebase core plugin `` flutter pub add firebase_core ``.

Run `` flutterfire configure `` command and select previously created firebase project from terminal..

<b>Now Firebase is connected with our project.</b>

Import following dependency in main.dart file 

```
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
```

Install authentication and FireStore plugins in project using following commands

```
flutter pub add firebase_auth
flutter pub add cloud_firestore
```

Change default config in android -> app -> build.gradle as follow

```
defaultConfig {
    (https://developer.android.com/studio/build/application-id.html).
    applicationId "com.example.tutorial2"
    minSdkVersion 21
    targetSdkVersion 33
    versionCode flutterVersionCode.toInteger()
    versionName flutterVersionName
}
```

change main method as async and add following code
```
WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
```



