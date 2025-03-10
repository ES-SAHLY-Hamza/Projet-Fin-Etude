import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseflutter/Components/buttomCustom.dart';
import 'package:courseflutter/Components/textFormCustom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FloatAction extends StatefulWidget {
  const FloatAction({super.key});

  @override
  State<FloatAction> createState() => _FloatAction();

}
class _FloatAction extends State<FloatAction> {
  TextEditingController controllerDocument = TextEditingController();
  CollectionReference categories = FirebaseFirestore.instance.collection('categories');
  GlobalKey<FormState> globalKey = GlobalKey();
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return categories
        .add({ "name" : controllerDocument.text , "id" : FirebaseAuth.instance.currentUser!.uid})
        .then((value) => print("Categories Added"))
        .catchError((error) => print("Failed to add categories: $error"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase Firestore"),
        ),
      body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Form(
            key: globalKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Container(
                      margin: EdgeInsets.only(right: 250),
                      child: Text("Document", style: TextStyle(fontSize: 20 , color: Colors.grey),),
                    ),
                    SizedBox(height: 10,),
                  TextForm(hintedText: "Entrer your document ", controller: controllerDocument, validator: (value) {
                    if(value!.isEmpty) {
                      return "Can't be empty";
                    }
                  },),
                  SizedBox(height: 20,),
                  BouttonCustom(title: "Add to Firestore", onPressed: () {
                      if(globalKey.currentState!.validate()) {
                        addUser();
                        Navigator.of(context).pushNamedAndRemoveUntil("/homepage", (route) => false,);
                      }
                  })
                ],
            ),
          ),
      ),
    );
  }

}