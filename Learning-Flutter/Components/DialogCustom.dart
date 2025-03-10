import 'package:flutter/material.dart';

class DialogCustom extends StatelessWidget {

  final IconData CustomIcon ;
  final String title;
  final String description;
  final String text;
  final Color colors;
  final Color ColorBack;
  const DialogCustom({super.key, required this.CustomIcon, required this.title, required this.description, required this.colors, required this.ColorBack, required this.text});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(CustomIcon, color: colors),
          SizedBox(width: 10),
          Text(title, style: TextStyle(color: colors)),
        ],
      ),
      content: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(text),
          style: TextButton.styleFrom(
            foregroundColor: ColorBack, backgroundColor: colors,
          ),
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),

    );
  }
}