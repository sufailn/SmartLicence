import 'package:flutter/material.dart';
import 'package:smart_license/auth/login.dart';
import 'package:smart_license/auth/sighup.dart';
import 'package:smart_license/screens/profilescreen.dart';
import 'package:smart_license/screens/trafic/fine.dart';
import 'package:smart_license/screens/trafic/searchlicence.dart';
import 'package:smart_license/screens/trafic/searchvechicle.dart';
import 'package:smart_license/screens/trafic/traffichome.dart';
import 'package:smart_license/screens/trafic/trafficnotification.dart';
import 'package:smart_license/screens/user/home.dart';
import 'package:smart_license/screens/user/showvechicle.dart';
import 'package:smart_license/screens/user/viewlicense.dart';
import 'package:smart_license/screens/user/viewnotification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ProfileThreePage()
      // home: Signup(),
      home: Homescreen(),
      // home: ShowLisence(),
    );
  }
}

void navigation(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void navigationreplacement(context, screen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}
