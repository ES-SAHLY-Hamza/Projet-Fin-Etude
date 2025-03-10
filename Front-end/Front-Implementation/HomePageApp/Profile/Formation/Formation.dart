import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseflutter/FlutterWithDB/HomePageApp/NavigationBotton/HomeBouttomsSheets.dart';
import 'package:courseflutter/FlutterWithDB/HomePageApp/Profile/Apropos/TextFormApropos.dart';
import 'package:courseflutter/FlutterWithDB/TextFormCustom/StackBorder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Formation extends StatefulWidget {
  final String docid;
  const Formation({super.key, required this.docid});

  @override
  State<Formation> createState() => _FloatAction();

}
class _FloatAction extends State<Formation> {
  TextEditingController controllerUniversite = TextEditingController();
  TextEditingController controllerDiplome = TextEditingController();
  TextEditingController controllerDomaine = TextEditingController();
  TextEditingController controllerAnneeF = TextEditingController();
  TextEditingController controllerAnneeD = TextEditingController();
  TextEditingController controllerResultat = TextEditingController();

  CollectionReference profiles = FirebaseFirestore.instance.collection('profiles');
  GlobalKey<FormState> globalKey = GlobalKey();
  bool isLoading = false;
  Map<String, dynamic>? userData;

  Future<void> _checkAndLoadProfileData() async {
    if (!mounted) return; // Vérifiez si le widget est encore monté
    setState(() {
      isLoading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 2));
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("profiles")
          .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        if(userData!['Universite'] == null){
          print('Pret pour ajouter les nouvelle champs de user Auth!!');
        }
        else{
          controllerUniversite.text = userData!['Universite'];
          controllerDiplome.text = userData!['Diplome'];
          controllerDomaine.text = userData!['Domaine'];
          controllerResultat.text = userData!['Resultat'];
          controllerAnneeD.text = userData!['AnneeD'];
          controllerAnneeF.text = userData!['AnneeF'];
        }
      } else {
        print("L'utilisateur est nouveau!!");
      }
    } catch (error) {
      print("Failed to load profile: $error");
    } finally {
      if (!mounted) return; // Vérifiez si le widget est encore monté
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _saveProfileData() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 2)); // Optionnel : délai pour simulation de chargement
      await profiles.doc(widget.docid).update({
        'Universite' : controllerUniversite.text ,
        'Diplome' : controllerDiplome.text,
        'Domaine' : controllerDomaine.text,
        'Resultat' : controllerResultat.text,
        'AnneeD' : controllerAnneeD.text,
        'AnneeF' : controllerAnneeF.text,
      });
      print("Formation updated or added for existing user");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeBottomSheets(initialPage: 'profile'),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: const Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  'Les informations de profil ont été mises à jour avec succès.',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 6,
          margin: EdgeInsets.all(10),
        ),
      );
    } catch (error) {
      print("Failed to save/update résumé: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erreur lors de la mise à jour du résumé. Veuillez réessayer.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _checkAndLoadProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Ajouter une formation" , style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: "assets/Roboto-Regular.ttf",
        ),),
      ),
      body: Stack(
        children: [
          isLoading ? Center(child: CircularProgressIndicator(color: Colors.blue)) : Container(
            child: Form(
                key: globalKey,
                child: ListView(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(child: Icon(Icons.warning , color: Colors.yellowAccent[700],) , margin: EdgeInsets.only(bottom: 20 , left: 20),),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5 , top: 7),
                            child: const Text("Veuillez remplir le formulaire qui fait référence a votre propre informations !" ,
                                style: TextStyle(
                                    fontFamily: "assets/Roboto-Regular.ttf",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    SizedBox(height: 5,),
                    TextForm(controller: controllerUniversite, validator: (value) {
                      if(value!.isEmpty){
                        return "Saisissez votre université";
                      }
                    }, hintText: 'Etablissement/université',),
                    SizedBox(height: 15) ,
                    TextForm(controller: controllerDiplome, validator: (value) {
                      if(value!.isEmpty){
                        return "Saisissez Diplome";
                      }
                    }, hintText: 'Diplome',),
                    SizedBox(height: 15),
                    TextForm(controller: controllerDomaine, validator: (value) {
                      if(value!.isEmpty){
                        return "Saisissez votre domaine";
                      }
                    }, hintText: "Domaine d'études"),
                    SizedBox(height: 15),
                    TextForm(controller: controllerResultat, validator: (value) {
                      if(value!.isEmpty){
                        return "Saisissez votre résultat";
                      }
                    }, hintText: "Résultat obtenu"),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextForm(controller: controllerAnneeD, validator: (value) {
                            if(value!.isEmpty){
                              return "Saisissez votre année de début";
                            }
                          }, hintText: 'Année de début',),
                        ),
                        Expanded(
                          child: TextForm(controller: controllerAnneeF, validator: (value) {
                            if(value!.isEmpty){
                              return "Saisissez votre année de fin";
                            }
                          }, hintText: 'Année de fin'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      height: 40,
                      child: MaterialButton(
                        shape: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: (){
                          if(globalKey.currentState!.validate()) {
                            _saveProfileData();
                          }
                        },
                        child: Text("Enregistrer", style: TextStyle(fontSize: 15, fontFamily: "assets/Roboto-Regular.ttf",)) ,
                      ),
                    ),
                    SizedBox(height: 100,)
                  ],
                )
            ),
          ),
        ],
      ),

    );
  }

}