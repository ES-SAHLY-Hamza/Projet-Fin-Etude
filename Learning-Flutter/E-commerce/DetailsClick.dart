import 'package:flutter/material.dart';

class DetailsClick extends StatefulWidget{
  final dataitems;
  const DetailsClick({super.key, this.dataitems});
  @override
  State<DetailsClick> createState() => _DetailsClick();
}

class _DetailsClick extends State<DetailsClick>{

  String? color;
  List<Map> images = [
    {
      "image" : "assets/spadrille-removebg-preview.png"
    },
    {
      "image" : "assets/spadrille2-removebg-preview.png"
    },
    {
      "image" : "assets/spadrille3-removebg-preview.png"
    }
  ];

  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87,
          size: 30,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 30 , top: 15),
            child: Row(
              children: [
                const Icon(Icons.circle_outlined , color: Colors.orange),
                const SizedBox(width: 10),
                const Text("Gipsy" , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )),
                const SizedBox(width: 5),
                const Text("Bee" , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  color: Colors.orange
                )),
                const SizedBox(width: 100,),
                Container(
                  child: Icon(Icons.menu),
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [
                Container(
                  color: Colors.grey[200],
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 300,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      onPageChanged: (value) {
                        print(value);
                      },
                      itemBuilder: (context, index) {
                          return Column(
                            children: [
                                Expanded(child: Container(
                                  child: Image.asset(widget.dataitems["photos"]),
                                )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10 , left: 10),
                                      height : 17,
                                      width : 17,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.orange
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      height : 17,
                                      width : 17,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.grey[400]
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      height : 17,
                                      width : 17,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                )
                            ],
                          );
                      },
                  )
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        //color : Colors.red,
                        margin: EdgeInsets.only(top: 20),
                        child: Text("Kinetix KB 231 Sport Shoes" , style: TextStyle(
                          fontSize: 25,
                          fontWeight:FontWeight.bold,
                        ),),
                      ),
                      SizedBox(height: 6),
                      Text("Men's shoes" , style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      )),
                      SizedBox(height: 10,),
                      Text(widget.dataitems["price"] , style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      )),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    children: [
                      Container(
                       margin: EdgeInsets.only(bottom: 60),
                        child: Text("Color : " , style: TextStyle(
                          fontSize: 20,
                        ),),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            RadioListTile(
                              title: Text("Gray"),
                              value: "Gray",
                              activeColor: Colors.blue,
                              groupValue: color,
                              onChanged: (value) {
                                color = value;
                              },
                            ),
                            RadioListTile(
                              title: Text("Black"),
                              value: "Gray",
                              activeColor: Colors.blue,
                              groupValue: color,
                              onChanged: (value) {
                                color = value;
                              },
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  child: MaterialButton(
                    color: Colors.black87,
                    textColor: Colors.white,
                    onPressed: () {

                  },child: Text("+Add To Card"),),
                )
            ],
          ),
      ),
    );
  }
}
