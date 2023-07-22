import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pre_grad_project/auth/login.dart';
import 'package:pre_grad_project/auth/signup.dart';
import 'package:pre_grad_project/screens/homepage.dart';
import 'screens/addnotes.dart';
import 'auth/login.dart';
import 'auth/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Login(),
      debugShowCheckedModeBanner: false,
      routes: {
        "signup": (context) => Signup(),
        "login": (context) => Login(),
        "homepage": (context) => Home(),
        "addnotes": (context) => addnotes(),
      },
    );
  }
}
