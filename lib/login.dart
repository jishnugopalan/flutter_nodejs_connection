import 'dart:convert';

import 'package:demoapp2/forms.dart';
import 'package:demoapp2/services/userservice.dart';
import 'package:demoapp2/usertypes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  UserService _userService = UserService();
  final storage = FlutterSecureStorage();
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, show a success message

      var userdata = jsonEncode({
        "email": _emailController.text,
        "password": _passwordController.text,
      });
      print(userdata);
      try {
        final response = await _userService.loginUser(userdata);
        print(response.data);
        await storage.write(key: "userdata", value: jsonEncode(response.data));
        if (response.data["usertype"] == "user") {
          Navigator.pushNamedAndRemoveUntil(
              context, '/customer', (route) => false);
        }
      } on DioException catch (e) {
        print(e.response!.data);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Failed: ${e.response!.data}')),
        );
      }

      // if (_emailController.text == "admin@gmail.com") {
      //   Navigator.pushNamedAndRemoveUntil(context, '/admin', (route) => false);
      // } else if (_emailController.text == "seller@gmail.com") {
      //   Navigator.pushNamedAndRemoveUntil(context, '/seller', (route) => false);
      // } else if (_emailController.text == "customer@gmail.com") {
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, '/customer', (route) => false);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name Field

              SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email is required';
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Phone Field

              // Password Field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Login'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UserType()),
                    );
                  },
                  child: Text("Register")),
              // TextButton(onPressed: (){}, child: Text("Register")),
              // IconButton(onPressed: (){}, icon: Icon(Icons.people))
            ],
          ),
        ),
      ),
    );
  }
}
