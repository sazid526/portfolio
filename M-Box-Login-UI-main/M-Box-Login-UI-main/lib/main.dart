import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(height: 50, image: AssetImage("images/logo.png")),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Maintenance",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Rubik Medium",
                              color: Color(0xff2D3142)),
                        ),
                        Text(
                          "Box",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Rubik Medium",
                              color: Color(0xffF9703B)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Rubik Medium",
                      color: Color(0xff2D3142)),
                )),
                SizedBox(
                  height: 14,
                ),
                Center(
                    child: Text(
                  "simply dummy text of the printing\n and typesetting industry of the ",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Rubik Regular",
                      color: Color(0xff4C5980)),
                )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:  EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F9FA),
                      hintText: "E-mail",
                      filled: true,
                      prefixIcon: Icon(Icons.email,color: Color(0xff323F48),),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F9FA),
                      hintText: "Password",
                      filled: true,
                      prefixIcon: Icon(Icons.lock,color: Color(0xff323F48),),
                      suffixIcon: Icon(Icons.visibility_off),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 15),

                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Rubik Regular",
                        color: Color(0xff4C5980)),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color(0xffF9703B),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Rubik Regular",
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Rubik Regular",
                          color: Color(0xff4C5980)),
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Rubik Medium",
                          color: Color(0xffF9703B)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
