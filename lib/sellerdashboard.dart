import 'package:flutter/material.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({super.key});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  final List<Map<String,dynamic>> data=[
    {
    "id":1,"name":"abc"
  },
    {
      "id":2,
      "name":"efg"
    },
    {
      "id":3,
      "name":"hij"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Seller Dashboard"),


    ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(accountName: Text("Jishnu"), accountEmail: Text("Jishnu@gmail.com"),
                currentAccountPicture: CircleAvatar(child: Text("J",style: TextStyle(fontSize: 40),),),
              ),
              ListTile(title: Text("Home"),leading: Icon(Icons.home,color: Colors.blue,),
                onTap: (){

                },
              ),
              ListTile(title: Text("About"),leading: Icon(Icons.help,color: Colors.blue,),
                onTap: (){

                },
              ),
              ListTile(title: Text("Contact"),leading: Icon(Icons.phone,color: Colors.blue,),
                onTap: (){

                },
                
              ),

              
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
          itemBuilder: (context,index){
          return ListTile(title: Text(data[index]["name"]),);
          }),
    );
  }
}
