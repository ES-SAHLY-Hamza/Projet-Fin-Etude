import 'package:courseflutter/HomePage.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget{

  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.grey,
        backgroundColor: Colors.blue,
        toolbarHeight: 50.0,
        title: const Text("Contact",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children:  [
            Container(
              color: Colors.red,
              height: 270,
              child: Image.asset("assets/srtipe.jpg" , fit: BoxFit.fill),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: const Text("Welcome to the our Home page application" , style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              )),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 80),
              margin: EdgeInsets.only(top: 10),
              child:MaterialButton(
                color: Colors.purple,
                elevation: 6,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context)
                      .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage(),),(route) => false);
                },
                child: Text("Move(pushAndRemoveUntil)"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 150),
              margin: EdgeInsets.only(top: 10),
              child:MaterialButton(
                color: Colors.purple,
                elevation: 6,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context)
                      .pop();
                },
                child: Text("Back"),
              ),
            )
          ],
        ),
      ),
    );
  }


}