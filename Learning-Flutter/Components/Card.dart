import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {

  final String image ;
  final String title;
  const CardCustom(this.image, {super.key, required this.title});

  @override
  Widget build(BuildContext context) {
   return Card(
     color: Colors.grey[200],
     margin: EdgeInsets.all(5),
     child: Container(
       margin: EdgeInsets.symmetric(horizontal: 15),
       child: Column(
         children: [
           Image.asset(image , height: 120,),
           Container(child: Text(title , style: TextStyle(fontSize: 20),))
         ],
       ),
     ),
   );
  }

}