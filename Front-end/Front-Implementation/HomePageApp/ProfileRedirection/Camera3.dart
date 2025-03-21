import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Camera3 extends StatefulWidget {
  final Widget widget;
  final String userId; // Ajouter profileId

  Camera3({Key? key, required this.widget,required this.userId}) : super(key: key);

  @override
  _CameraProfileState createState() => _CameraProfileState();
}

class _CameraProfileState extends State<Camera3> {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  bool isGoogleUser = false;
  Map<String, dynamic>? userData;

  Future<List<Map<String, dynamic>>> getProfileByUserID(String userId) async {
    List<Map<String, dynamic>> allProfiles = [];
    try {
      QuerySnapshot profilesSnapshot = await FirebaseFirestore.instance.collection('profiles').get();
      for (QueryDocumentSnapshot profileDoc in profilesSnapshot.docs) {
        if (profileDoc.id == userId) { // Filtrer par profileId
          allProfiles.add(profileDoc.data() as Map<String, dynamic>);
          break; // Sortir de la boucle si le profil correspondant est trouvé
        }
      }
    } catch (e) {
      print('Erreur lors de la récupération des annonces: $e');
    }

    return allProfiles;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            height: 145,
            width: 140,
            margin: EdgeInsets.only(left: 15),
            padding: EdgeInsets.all(4),
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: getProfileByUserID(widget.userId), // Passer profileId ici
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading image'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text('No image available'));
                } else {
                  var profiles = snapshot.data!;

                  return ListView(
                    children: profiles.map((data) {
                      String ProfileImage = data['ProfileImage'];
                      return Container(
                        height: 135,
                        child: ProfileImage.startsWith('http')
                            ? CircleAvatar(
                          backgroundImage: NetworkImage(ProfileImage),
                        )
                            : CircleAvatar(
                          backgroundImage: FileImage(File(ProfileImage)),
                          child: ProfileImage.isEmpty
                              ? Icon(Icons.person)
                              : null,
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
          Positioned(
            child: widget.widget,
          ),
        ],
      ),
    );
  }
}
