import 'package:courseflutter/FlutterWithDB/Authentification/LoginStripe.dart';
import 'package:courseflutter/FlutterWithDB/HomeUI/HomePageUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleOut {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FlutterSecureStorage storage = FlutterSecureStorage();
  Future<void> logout(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      // Vérifiez si l'utilisateur est connecté
      if (user != null) {
        if (user.providerData.any((provider) => provider.providerId == 'google.com')) {
          await googleSignIn.signOut();
          //await storage.delete(key: 'userEmail');
        }
        await FirebaseAuth.instance.signOut();
        //await storage.delete(key: 'userEmail');
      }
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginStripe()),
      );
    } catch (e) {
      print(e);
      throw e; // Propager l'erreur pour la gestion ultérieure
    }
  }
}
