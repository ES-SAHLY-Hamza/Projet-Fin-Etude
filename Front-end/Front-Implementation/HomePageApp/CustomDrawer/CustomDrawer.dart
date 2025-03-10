import 'dart:io';
import 'package:flutter/material.dart';
import 'package:courseflutter/FlutterWithDB/HomePageApp/Drawer/DrawerButtom.dart';

class CustomDrawer extends StatelessWidget {
  final bool isGoogleUser;
  final String userEmail;
  final Future<String?> Function() getProfileImageUrl;
  final Future<String> Function() getUserName; // Ajoutez ce paramètre
  final VoidCallback onHomePressed;
  final VoidCallback onProfilePressed;
  final VoidCallback onAboutUsPressed;
  final VoidCallback onSignOutPressed;

  const CustomDrawer({
    Key? key,
    required this.isGoogleUser,
    required this.userEmail,
    required this.getProfileImageUrl,
    required this.onHomePressed,
    required this.onProfilePressed,
    required this.onAboutUsPressed,
    required this.onSignOutPressed,
    required this.getUserName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        borderSide: BorderSide.none,
      ),
      child: Container(
        /*decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images9.jpg'),
            fit: BoxFit.fill,
          ),
        ),*/
        child: Column(
          children: [
            /*Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset("assets/images8.png")),*/
            Container(
              decoration: const BoxDecoration(
              color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/fondDrawer.jpg'),
                  fit : BoxFit.fill
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40 , left: 110),
                        height: 80,
                        width: 80,
                        child: FutureBuilder<String?>(
                          future: getProfileImageUrl(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error loading image'));
                            } else if (!snapshot.hasData || snapshot.data == null) {
                              return Center(child: Text('No image available'));
                            } else {
                              return ClipOval(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: onProfilePressed,
                                    child: isGoogleUser
                                        ? Image.network(
                                      snapshot.data!,
                                      fit: BoxFit.cover,
                                    )
                                        : Image.file(
                                      File(snapshot.data!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 115),
                        child: FutureBuilder<String>(
                          future: getUserName(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(child: Text('Loading...')),
                                  ],
                                ),
                                subtitle: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          userEmail,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: "assets/Roboto-Regular.ttf",
                                            color: Colors.grey[800],
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              );
                            } else if (snapshot.hasError) {
                              return ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(child: Text('User')),
                                  ],
                                ),
                                subtitle: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          userEmail,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: "assets/Roboto-Regular.ttf",
                                            color: Colors.grey[800],
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else if (!snapshot.hasData || snapshot.data == null) {
                              return ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(child: Text('User')),
                                  ],
                                ),
                                subtitle: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          userEmail,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: "assets/Roboto-Regular.ttf",
                                            color: Colors.grey[800],
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              );
                            } else {
                              return ListTile(
                                title: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data!,
                                        style: TextStyle(
                                            fontFamily: "assets/Roboto-Regular.ttf",
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        userEmail,
                                        style: TextStyle(
                                          fontFamily: "assets/Roboto-Regular.ttf",
                                          color: Colors.grey[800],
                                          fontSize: 13
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10 , top: 5),
                              child: Image.asset("assets/images8.png",height: 40,)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            DrawerCustom(
              iconData: Icons.add_home_outlined,
              TypeBouton: "Home",
              fontFamily: "assets/Roboto-Regular.ttf",
              color: Colors.black87,
              onPressed: onHomePressed,
            ),
            DrawerCustom(
              iconData: Icons.account_circle_outlined,
              TypeBouton: "Compte",
              fontFamily: "assets/Roboto-Regular.ttf",
              color: Colors.black87,
              onPressed: onProfilePressed,
            ),
            DrawerCustom(
              iconData: Icons.info_outline,
              TypeBouton: "À propos de nous",
              fontFamily: "assets/Roboto-Regular.ttf",
              color: Colors.black87,
              onPressed: onAboutUsPressed,
            ),
            DrawerCustom(
              iconData: Icons.exit_to_app,
              TypeBouton: "se déconnecter",
              fontFamily: "assets/Roboto-Regular.ttf",
              color: Colors.red,
              onPressed: onSignOutPressed,
            ),
          ],
        ),
      ),
    );
  }
}
