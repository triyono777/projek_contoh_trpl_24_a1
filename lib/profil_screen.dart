import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Profil"),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.network("https://udb.ac.id/storage/app/media/uploaded-files/LOGO---BOTTOM-TEXT.jpg",height: 100,),
            Image.asset("asset/luffy.webp",height: 200,),
            Card(child: Text("Luffy",style: TextStyle(fontSize: 30,color: Colors.red,),)),
            Text("alamat"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.favorite),
              Icon(Icons.favorite),
              Icon(Icons.favorite),
            ],),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("alamat"),
              subtitle: Text("Arabasta"),
              trailing: Icon(Icons.arrow_circle_right),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text("Hobi"),
                subtitle: Text("Makan"),
                trailing: Icon(Icons.arrow_circle_right),
              ),
            ),
             Card(
              child: ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text("Hobi"),
                subtitle: Text("Makan"),
                trailing: Icon(Icons.arrow_circle_right),
              ),
            ), Card(
              child: ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text("Hobi"),
                subtitle: Text("Makan"),
                trailing: Icon(Icons.arrow_circle_right),
              ),
            ), Card(
              child: ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text("Hobi"),
                subtitle: Text("Makan"),
                trailing: Icon(Icons.arrow_circle_right),
              ),
            ), Card(
              child: ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text("Hobi"),
                subtitle: Text("Makan"),
                trailing: Icon(Icons.arrow_circle_right),
              ),
            ), Card(
              child: ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text("Hobi"),
                subtitle: Text("Makan"),
                trailing: Icon(Icons.arrow_circle_right),
              ),
            ), Card(
              child: ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text("Hobi"),
                subtitle: Text("Makan"),
                trailing: Icon(Icons.arrow_circle_right),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
              ),
            ),
            

            ],        
          ),
      ),
    );
  }
}