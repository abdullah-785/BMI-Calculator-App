import 'package:flutter/material.dart';


class IconTextFile extends StatelessWidget {

IconTextFile({this.icon,this.label});

final IconData icon;
final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
        size: 70.0,
        color: Colors.white,
        ),
        Text(label, style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
        ),
      ],
    );
  }
}
