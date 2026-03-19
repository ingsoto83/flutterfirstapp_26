import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget imageSection = Image.asset('assets/img/event.jpg',width: size.width, height: size.height * 0.30, fit: BoxFit.cover,);
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Text("Motocross 2026",style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text("Saltillo, Coahuila, México", style: TextStyle(color: Colors.grey[500]))
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.orange[500],),
          Text('41'),
        ],
      )
    );
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(child: _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),onTap: (){print("CALLING...");},),
        _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
      ],
    );
    return Scaffold(
     body: Column(
       children: [
         imageSection,
         titleSection,
         buttonSection
       ],
     )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color:color),
        SizedBox(height: 8,),
        Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w400),)
      ],
    );
  }
}
