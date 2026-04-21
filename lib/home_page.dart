import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _db = FirebaseFirestore.instance;
  String _msg = '';
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed: (){
            _auth.signOut();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:ListView()
          ),
          Container(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextFormField(
                          validator: (value)=>  value!.isEmpty ? "escribe tu mensaje" : null,
                          onSaved: (value)=>_msg= value??"",
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: "Escribe tu mensaje",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                                  gapPadding: 10
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.teal, width: 2),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(20, 20)
                                  )
                              )
                          )
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    final msg  = <String, dynamic>{
                      "message": _msg,
                      "timestamp": FieldValue.serverTimestamp(),
                      "from": _auth.currentUser!.email??'undefined'
                    };
                    _db.collection('messages').add(msg);
                  }
                }, icon: Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }
}
