import 'package:flutter/material.dart';
import 'package:projek_contoh_trpl_24_a1/home.dart';
import 'package:projek_contoh_trpl_24_a1/penghitung_screen.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key, this.username });

  final String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Profil $username"),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.network("https://udb.ac.id/storage/app/media/uploaded-files/LOGO---BOTTOM-TEXT.jpg",height: 100,),
            Image.asset("asset/luffy.webp",height: 200,),
            Card(child: Text("Luffy",style: TextStyle(fontSize: 30,color: Colors.red,),)),
             TextButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> PenghitungScreen()));
            }, child: Text("Pindah Penghitung")),

             TextButton(onPressed: (){
              
                        Navigator.pop(context);
            }, 
            child: Text("Kembali")),


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