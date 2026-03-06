import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplo Imagenes"),
      ),
      body: Container(
        height: 500,
        width: 300,
        child: Image.asset('assets/img/fondo.jpg'),
      ),
    );
  }
}
