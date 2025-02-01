import 'package:demoapp2/admindasboard.dart';
import 'package:demoapp2/customerdashboard.dart';
import 'package:demoapp2/demo.dart';
import 'package:demoapp2/forms.dart';
import 'package:demoapp2/login.dart';
import 'package:demoapp2/sellerdashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue,titleTextStyle: TextStyle(color: Colors.white,fontSize: 21))
      ),
      title: "My App",
      home: LoginPage(),
      routes: {
        '/admin':(context)=>AdminDashboard(),
        '/customer':(context)=>CustomerDashboard(),
        '/seller':(context)=>SellerDashboard()

      },
    );
  }
}

