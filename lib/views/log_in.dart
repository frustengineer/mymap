import 'package:flutter/material.dart';
import 'package:my_map/views/sign_up.dart';
import 'package:my_map/main.dart';
import 'home_page.dart';
import 'package:my_map/backend/auth.dart';
import 'package:my_map/backend/news.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Auth a = Auth();
  String err1 = '';
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xced3dc),
        leadingWidth: 0,
        elevation: 0,
        title: Text(
          "MyNews",
          style:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: h * 0.30,
            width: w * 1,
            color: Color(0xced3dc),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              onChanged: (value) {
                a.email = value;
              },
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              onChanged: (value) {
                a.password = value;
              },
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            height: h * 0.3,
            width: w * 1,
            color: Color(0xced3dc),
            child: Center(
              child: Text(
                "$err1",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await a.SignIn();
              if (a.message == '') {
                Navigator.push(
                    context,
                    (MaterialPageRoute(
                        builder: (context) => const HomePage())));
                setState(() {
                  err1 = '';
                });
                a.email = '';
                a.message = '';
                a.password = '';
                a.name = '';
              } else {
                setState(() {
                  err1 = a.message;
                });
              }
              fetchNewsData();
            },
            child: Container(
              height: h * 0.07,
              width: w * 0.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent,
              ),
              child: Center(
                  child: Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white),
              )),
            ),
          ),
          Container(
            height: h * 0.01,
            width: w * 1,
            color: Color(0xf5f9fd),
          ),
          Center(
            child: Row(
              children: [
                Container(
                  height: h * 0.03,
                  width: w * 0.35,
                  color: Color(0xced3dc),
                ),
                Container(
                  height: h * 0.03,
                  child: Text(
                    "New here?",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        (MaterialPageRoute(builder: (context) => SignUp())));
                  },
                  child: Container(
                    height: h * 0.03,
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
