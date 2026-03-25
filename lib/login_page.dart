import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible = false;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Iniciar sesión"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FlutterLogo(size: 120,),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Correo electrónico",
                    labelStyle: TextStyle(color: Colors.purple),
                    isDense: true,
                    hintText: "Ingrese su correo",
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: TextFormField(
                  obscureText: visible ? false : true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            visible = !visible;
                          });
                        },
                        child: Icon(visible ? Icons.visibility_off : Icons.visibility)
                    ),
                    labelText: "Contraseña",
                    labelStyle: TextStyle(color: Colors.purple),
                    isDense: true,
                    hintText: "Ingrese su contraseña",
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
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                margin: EdgeInsets.only(top: 20),
                child:ElevatedButton(onPressed: (){}, child: Text("Iniciar sesión"), style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white))
              )
            ],
          ),
        ),
      ),
    );
  }
}
