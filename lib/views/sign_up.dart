import 'package:flutter/material.dart';
import 'log_in.dart';
import 'package:my_map/backend/auth.dart';
import 'home_page.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Auth a = Auth();
  String err = "";

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

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
            height: h * 0.20,
            width: w * 1,
            color: Color(0xced3dc),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              onChanged: (value) {
                a.name = value;
              },
              decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          SizedBox(
            height: 20,
            child: Container(color: Color(0xced3dc),),
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
             child: Container(color: Color(0xced3dc),),
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
            height: h * 0.25,
            width: w * 1,
            color:  Color(0xced3dc),
            child: Center(
              child: Text(
                "$err",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await a.Register();
              if (a.message == '') {
                Navigator.push(
                    context,
                    (MaterialPageRoute(
                        builder: (context) => const HomePage())));
                setState(() {
                  err = '';
                });
                a.email = '';
                a.message = '';
                a.password = '';
                a.name = '';
              } else {
                setState(() {
                  err = a.message;
                });
              }
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
                "Signup",
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
            color:  Color(0xced3dc),
          ),
          Center(
            child: Row(
              children: [
                Container(
                  height: h * 0.03,
                  width: w * 0.23,
                  color:  Color(0xced3dc),
                ),
                Container(
                  height: h * 0.03,
                  child: Text(
                    "Already have an Account?",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        (MaterialPageRoute(builder: (context) => LogIn())));
                  },
                  child: Container(
                    height: h * 0.03,
                    child: Text(
                      "Login",
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
