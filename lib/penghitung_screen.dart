import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
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
          ],
        ),
      ),
    );
  }
}