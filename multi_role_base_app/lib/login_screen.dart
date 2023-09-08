import 'package:flutter/material.dart';
import 'package:multi_role_base_app/HomeScreen.dart';
import 'package:multi_role_base_app/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  final formData = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "E-mail"
            ),
          ),
          SizedBox(height: 30,),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: passwordController,
            decoration: InputDecoration(
                hintText: "Password"
            ),
          ),
          SizedBox(height: 30,),
          TextFormField(
            controller: ageController,
            decoration: InputDecoration(
                hintText: "age"
            ),
          ),
          SizedBox(height: 30,),
          InkWell(
            onTap: () async{
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setString("email", emailController.text.toString());
              sp.setInt("age", 25);
              sp.setBool("isLogin", true);
              sp.setString("userType", "student");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentScreen()));

            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.orangeAccent,
              child: Center(child: Text("Login")),
            ),
          )
        ],
      ),
    );
  }
}
