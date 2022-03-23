import 'package:flutter/material.dart';


class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({@required this.cardWidget, @required this.colors, @required this.onpressed});
final Widget cardWidget;
final Color colors;
final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
                  margin: EdgeInsets.all(15.0),
                  child: cardWidget,
                  decoration: BoxDecoration(
                    color: Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
    );
  }
}