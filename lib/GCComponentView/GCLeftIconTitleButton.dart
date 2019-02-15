import 'package:flutter/material.dart';
class GCLeftIconTitleButton extends StatefulWidget {
  GCLeftIconTitleButton({Key key,this.image,this.title,this.onTap}):super(key : key);
  final Image image;
  final Text title;
  final void Function() onTap;
  
  @override
  _GCLeftIconTitleButtonState createState() => _GCLeftIconTitleButtonState();
}

class _GCLeftIconTitleButtonState extends State<GCLeftIconTitleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
      child: Row(
        children: <Widget>[
          widget.image,
          SizedBox(width: 5,),
          widget.title
        ],
      ),
    ),
    onTap:widget.onTap,
    );
  }
}