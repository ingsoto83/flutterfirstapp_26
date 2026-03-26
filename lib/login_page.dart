import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible = false;
  final _formKey = GlobalKey<FormState>();
  String email='';
  String pass='';

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
                  validator: (value)=>  value!.isEmpty ? "Ingrese su correo electrónico" : value.contains("@") ? null : "Correo inválido...!",
                  onSaved: (value)=>email= value??"",
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
                  validator: (value)=>  value!.isEmpty ? "Ingrese su contraseña" : value.length > 5 ? null : "Contraseña al menos 6 caracteres...!",
                  onSaved: (value)=>pass= value??"",
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
                child:ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        showMessage(false, "Sesión iniciada correctamente...! Bienvenido!");
                      }else{
                          //Limpia el formulario
                        _formKey.currentState!.reset();
                        showMessage(true, "Correo o contraseña incorrectos...!");
                      }
                    },
                    child: Text("Iniciar sesión"), style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white))
              )
            ],
          ),
        ),
      ),
    );
  }

  void showMessage(bool err, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: err ? Colors.red : Colors.green,
            content: Row(
              children: [
                Icon(err ? Icons.error : Icons.check_circle),
                SizedBox(width: 16,),
                Expanded(child: Text(msg))
              ],
            )
        )
    );
  }
}
