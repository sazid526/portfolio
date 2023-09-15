import 'package:covid_tracker_app/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker_app/Model/worldStatesModel.dart';

void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue
      ),
      home: SplashScreen(),
    );
  }
}
