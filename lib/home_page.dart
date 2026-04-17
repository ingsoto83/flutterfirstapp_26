import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Home Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Bienvenido ${_auth.currentUser!=null ? _auth.currentUser!.email : ""} !!!"),
            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: (){
                _auth.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>LoginPage()
                    )
                );
              },
              child: Text("Cerrar sesión"),
            )
          ],
        ),
      ),
    );
  }
}
