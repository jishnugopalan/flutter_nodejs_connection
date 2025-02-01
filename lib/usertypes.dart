import 'package:demoapp2/forms.dart';
import 'package:flutter/material.dart';
class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose Your Registration",style: TextStyle(fontSize: 23),),
            TextButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FormPage()),
              );
            }, child: Text("Seller Registration")),
            TextButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FormPage()),
              );
            }, child: Text("Customer Registration")),
          ],
        ),
      ),
    );
  }
}
