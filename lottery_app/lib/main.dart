import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      debugShowCheckedModeBanner: false,
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  int x = 0;
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loterry App"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Lottery Wining Number is : 4")),
          SizedBox(height: 30,),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: x == 4 ? Colors.green.withOpacity(.5) : Colors.red.withOpacity(.5),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: x == 4 ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.done_outline_outlined,color: Colors.green,size: 35,),
                  SizedBox(height: 30,),
                  Text("Congratulation! You won the lottery. Your Number is  : $x .\n Try Again.",textAlign: TextAlign.center,),
                ],

              ) :
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error,color: Colors.red,size: 35,),
                    SizedBox(height: 30,),
                    Text("Better Time Next Time ! Your number is : $x .\n Try Again.",textAlign: TextAlign.center,),
                  ],

                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          x = random.nextInt(6);
          print(x);
          setState(() {

          });
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.green,
      ),
    );
  }
}
