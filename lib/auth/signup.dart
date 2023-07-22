import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState() {
    super.initState();
    newusernamestate = new GlobalKey<FormState>();
    newemailstate = new GlobalKey<FormState>();
    newpasswordstate = new GlobalKey<FormState>();
    nun = new TextEditingController();
    ne = new TextEditingController();
    np = new TextEditingController();
  }

  Signup() async {
    for (int i = 0; i < accounts.length; i++) {
      if (acc.contains(newuser)) {
        setState(() {
          Container(
            child: Text("this user registered before"),
          );
        });
      } else {
        setState(() {
          Map newuserinfo = {"name": "$newuser", "password": "$newpassword"};
          accounts.add(newuserinfo);
          Navigator.of(context).pushReplacementNamed("login");
          print(accounts);
        });
        break;
      }
    }
  }

  List acc = accounts.map((account) => account['name']).toList();
  GlobalKey<FormState>? newusernamestate;
  GlobalKey<FormState>? newemailstate;
  GlobalKey<FormState>? newpasswordstate;
  TextEditingController? nun;
  TextEditingController? ne;
  TextEditingController? np;
  String? newuser;
  String? email;
  String? newpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Container(
                child: Center(child: Image.asset("images/psu.jpeg")),
                height: 216,
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
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "required * ";
                            } else {
                              return null;
                            }
                          }),
                          // autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          key: newusernamestate,
                          controller: nun,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Username",
                              errorStyle:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.greenAccent,
                                    width: 2,
                                  ),
                                  gapPadding: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.greenAccent,
                                    width: 2,
                                  ),
                                  gapPadding: 20)),
                          onEditingComplete: (() {
                            setState(() {
                              newuser = nun!.text;
                            });
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: ((value) {
                            if (value!.contains("@")) {
                              return null;
                            } else {
                              return "Enter valid Email ";
                            }
                          }),
                          // autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          key: newemailstate,
                          controller: ne,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Email",
                              errorStyle:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
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
                              email = ne!.text;
                            });
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: ((value) {
                            if (value!.length >= 8) {
                              return null;
                            } else {
                              return "Too short for Password ";
                            }
                          }),
                          // autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          key: newpasswordstate,
                          controller: np,
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
                              newpassword = np!.text;
                            });
                          }),
                        ),
                        TextButton(
                            onPressed: Signup,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, bottom: 10, top: 10),
                              child: Text(
                                "signup",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            )),
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
