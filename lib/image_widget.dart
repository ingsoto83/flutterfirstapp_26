import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Motocross App",style: GoogleFonts.blackOpsOne(color: Colors.white, fontSize: 30),),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/fondo.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Container(
            height: 150,
            width: double.infinity,
              color: Colors.black54,
              child: Center(
              child: Text(
                "Bienvenido a Motocross App",
                style: GoogleFonts.blackOpsOne(
                    color: Colors.white,
                    fontSize: 36
                ),
                textAlign: TextAlign.center,
              ),
          ),
          ),
        )
      ),
    );
  }
}
