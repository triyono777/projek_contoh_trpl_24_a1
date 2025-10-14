import 'package:flutter/material.dart';

import 'profil_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  TextEditingController usernameController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: "Username",
            hintText: "Masukkan Username",
            border: OutlineInputBorder()),
        ),
        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Masukkan Password",
            border: OutlineInputBorder()),
        ),
        ElevatedButton(onPressed: (){
 Navigator.of(context).push(
  MaterialPageRoute(builder: (_)=> ProfilScreen(username: usernameController.text,)));

        }, child: Text("Login"),)
        ],),
      ),
    ),
    );
  }
}