import 'package:flutter/material.dart';
import 'package:projek_contoh_trpl_24_a1/home.dart';
import 'profil_screen.dart';

class PenghitungScreen extends StatefulWidget {
  const PenghitungScreen({super.key});

  @override
  State<PenghitungScreen> createState() => _PenghitungScreenState();
}

class _PenghitungScreenState extends State<PenghitungScreen> {
  int nilai = 0;

  menghitung(){
    setState(() {});
    nilai = nilai + 1;
    print("ini nilai = $nilai");
  }

  pindahHalaman(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_)=>ProfilScreen(),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hitung $nilai"),
            ElevatedButton(
              onPressed: (){
              menghitung();
            }, 
            child: Text("Hitung"),),
            TextButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ProfilScreen()));


            }, child: Text("Pindah Profil")),
            
         ElevatedButton(onPressed: (){}, child: Text("Tombol")),
         
          TextButton(onPressed: (){
              Navigator.pop(context);      
            }, 
            child: Text("Kembali")),
          ],
        ),
      ),
    );
  }
}