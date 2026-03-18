import 'package:flutter/material.dart';

class ContainersWidget extends StatelessWidget {
  const ContainersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contenedores en Flutter"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text("Hola Mundo", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 8),
              child: Text("Desde", style: TextStyle(fontSize: 28)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Text("Saltiyork", style: TextStyle(fontSize: 28)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.orange,),
                  Icon(Icons.star, color: Colors.orange,),
                  Icon(Icons.star, color: Colors.orange,),
                  Icon(Icons.star, color: Colors.orange,),
                  Icon(Icons.star_half, color: Colors.orange,),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: (){}, child: Text("Edit")),
                ElevatedButton(onPressed: (){}, child: Text("Save")),
                ElevatedButton(onPressed: (){}, child: Text("Delete")),
              ],
            ),
            Stack(
              children: [
                Container(height: 200, width: 200, color: Colors.red,),
                Container(height: 150, width: 150, color: Colors.blue,),
                Container(height: 100, width: 100, color: Colors.cyan,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
