import 'package:courseflutter/Contact.dart';
import 'package:courseflutter/Exemple/InitialState.dart';
import 'package:flutter/material.dart';
import 'package:courseflutter/HomePage.dart';
class About extends StatelessWidget{

  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.grey,
        backgroundColor: Colors.blue,
        toolbarHeight: 50.0,
        //leading: Icon(Icons.arrow_back , color: Colors.white),
        title: const Text("About us",
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
              child: Image.asset("assets/images2.jfif" , fit: BoxFit.fill),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: const Text("Welcome to the page About us" , style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              )),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 120),
              margin: EdgeInsets.only(top: 10),
              child:MaterialButton(
                color: Colors.purple,
                elevation: 6,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed("/contact");
                },
                child: Text("Move Contact"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 120),
              margin: EdgeInsets.only(top: 10),
              child:MaterialButton(
                color: Colors.purple,
                elevation: 6,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Move HomePage"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 120),
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
            ),
          ],
        ),
      ),
    );
  }

}