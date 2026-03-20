import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget imageSection = Image.asset('assets/img/event.jpg',width: size.width, height: size.height * 0.30, fit: BoxFit.cover,);
    Widget imageSectionL = Image.asset('assets/img/event.jpg',width: size.width * 0.40, height: size.height, fit: BoxFit.cover,);
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
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child:Text('In volutpat leo a odio molestie, vel posuere leo blandit. Etiam dictum sed dui eget pellentesque. Vivamus vestibulum imperdiet cursus. Aliquam erat volutpat. Maecenas tincidunt neque odio, vel pharetra justo dignissim consectetur. Mauris aliquam, mi a pellentesque cursus, ante tellus dictum justo, nec malesuada magna orci ut odio. Maecenas et interdum tortor. Ut commodo tortor a molestie suscipit. Mauris facilisis, tortor sed lobortis mollis, dui elit iaculis metus, sed fringilla velit justo vitae augue. Cras in feugiat mauris. Fusce iaculis nulla tincidunt, suscipit dui vitae, suscipit metus. Aliquam sit amet tortor porta, convallis sem vel, vestibulum lectus. In viverra luctus nibh vitae efficitur. Proin vulputate tortor erat, a accumsan ipsum scelerisque a. Duis molestie nisl at ipsum gravida hendrerit.',
        softWrap: true,textAlign: TextAlign.justify,)
    );

    return Scaffold(
     body: OrientationBuilder(builder: (context, orientation){
       return orientation == Orientation.portrait ?
       SingleChildScrollView(
         child: Column(
           children: [
             imageSection,
             titleSection,
             buttonSection,
             textSection
           ],
         ),
       ) : Row(
         children: [
           imageSectionL,
           Expanded(
             child: ListView(
               children: [
                 titleSection,
                 buttonSection,
                 textSection
               ],
             ),
           )
         ]
       );
     })
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
