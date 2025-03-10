import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertdialogCustom {
  static void showErrorDialog(BuildContext context, AlertType alerte , String title, String description, Color color , String text , void Function()? onPressed) {
    Alert(
      context: context,
      type: alerte,
      title: title,
      desc: description,
      style: AlertStyle(
        descStyle: const TextStyle(
            fontSize: 15,
            fontFamily: "assets/Roboto-Regular.ttf" ),
        titleStyle: TextStyle(fontSize: 18, color: color),
        animationType: AnimationType.fromRight,
        alertPadding: EdgeInsets.symmetric(horizontal: 50 , vertical:300),
          overlayColor: Colors.black54,
          backgroundColor: Colors.grey[100]
      ),
      buttons: [
        DialogButton(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          onPressed:onPressed,
          width: 80,
          color: color,
        )
      ],
    ).show();
  }
}
