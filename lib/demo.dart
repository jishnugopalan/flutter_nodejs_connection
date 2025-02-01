import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset("assets/images.jpeg"),
              Container(color: Colors.yellow,width: 100,height: 100,margin: EdgeInsets.all(20),
                child: Text("Hello World",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.blue),),),
              Container(color: Colors.yellow,width: 100,height: 100,margin: EdgeInsets.all(20),
                child: Text("Hello World",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.blue),),),
              Container(color: Colors.yellow,width: 100,height: 100,margin: EdgeInsets.all(20),
                child: Text("Hello World",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.blue),),),
              Container(color: Colors.yellow,width: 100,height: 100,margin: EdgeInsets.all(20),
                child: Text("Hello World",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.blue),),),
              Container(color: Colors.yellow,width: 100,height: 100,margin: EdgeInsets.all(20),
                child: Text("Hello World",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.blue),),),
              Container(color: Colors.yellow,width: 100,height: 100,margin: EdgeInsets.all(20),
                child: Text("Hello World",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.blue),),),

            ],
          ),
        )
    );
  }
}
