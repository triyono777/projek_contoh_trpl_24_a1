import 'package:flutter/material.dart';
import 'package:projek_contoh_trpl_24_a1/penghitung_screen.dart';
import 'package:projek_contoh_trpl_24_a1/profil_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ElevatedButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ProfilScreen()));
        }, child: Text("profil")),
        ElevatedButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> PenghitungScreen()));

        }, child: Text("Penghitung")),

      ],),),
    );
  }
}