import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  final storage = FlutterSecureStorage();
  String name = "";
  getuser() {
    storage.read(key: "userdata").then((value) {
      print(value);
      var userdata = jsonDecode(value!);
      setState(() {
        name = userdata["name"];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Dashboard"),
      ),
      body: Column(
        children: [
          Text(name),
        ],
      ),
    );
  }
}
