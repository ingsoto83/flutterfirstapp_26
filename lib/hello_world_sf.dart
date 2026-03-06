import 'package:flutter/material.dart';

class HelloWorldSF extends StatefulWidget {
  HelloWorldSF({super.key});

  @override
  State<HelloWorldSF> createState() => _HelloWorldSFState();
}

class _HelloWorldSFState extends State<HelloWorldSF> {
  int count=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter First App SF"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count++;
          print("valor count = ${count}");
          setState(() {

          });
        },
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: Center(
          child: Text(
              "Presionaste el botón ${count} veces",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pinkAccent
              )
          )
      ),
    );
  }
}
