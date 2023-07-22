import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:core';
import 'signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

List accounts = [
  {"name": "ahmed", "password": "123456789"},
  {"name": "manar", "password": "1234567890"},
  {"name": "sam7", "password": "12345678901"},
  {"name": "sama", "password": "12345678902"},
  {"name": "mona", "password": "12345678903"},
];

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  savepref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("username", "$username");
      pref.setString("email", "$username@gmail.com");
    });
  }

  successfullogin() async {
    for (int i = 0; i < accounts.length; i++) {
      if (usercheck! == accounts[i][accounts[i].keys.elementAt(0)] &&
          passcheck! == accounts[i][accounts[i].keys.elementAt(1)]) {
        setState(() {
          username = usercheck;
          password = passcheck;
          Navigator.of(context).pushReplacementNamed("homepage");
          savepref();
        });
        // } else {
        //   setState(() {
        //     AwesomeDialog(
        //         context: context, dialogType: DialogType.info, desc: "try again")
        //       ..show();
        //   });
        // }
      }
    }
  }

  GlobalKey<FormState>? namestate = new GlobalKey<FormState>();
  GlobalKey<FormState>? emailstate = new GlobalKey<FormState>();
  TextEditingController? tc1 = new TextEditingController();
  TextEditingController? tc2 = new TextEditingController();
  String? usercheck;
  String? passcheck;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 33),
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Container(
                child: Center(child: Image.asset("images/psu.jpeg")),
                height: 250,
                width: double.infinity,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      child: Column(children: [
                        TextFormField(
                          // autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          key: namestate,
                          controller: tc1,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Username",
                              errorStyle:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.greenAccent,
                                    width: 2,
                                  ),
                                  gapPadding: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.greenAccent,
                                    width: 2,
                                  ),
                                  gapPadding: 20)),
                          onEditingComplete: (() {
                            setState(() {
                              usercheck = tc1!.text;
                            });
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          key: emailstate,
                          controller: tc2,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Password",
                              errorStyle:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.greenAccent,
                                    width: 2,
                                  ),
                                  gapPadding: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.greenAccent,
                                    width: 2,
                                  ),
                                  gapPadding: 20)),
                          onEditingComplete: (() {
                            setState(() {
                              passcheck = tc2!.text;
                            });
                          }),
                        ),
                        TextButton(
                            onPressed: successfullogin,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, bottom: 10, top: 10),
                              child: Text(
                                "Login",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            )),
                        Text(" OR "),
                        Container(
                          padding: EdgeInsets.only(left: 80),
                          child: Row(
                            children: [
                              Text("if you don't have account "),
                              SizedBox(
                                width: 2,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("signup");
                                },
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
