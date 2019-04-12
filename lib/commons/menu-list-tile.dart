import 'package:flutter/material.dart';
import 'package:flutterweb/theme.dart';

class MenuListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;

  MenuListTile(
      {@required this.title,
      @required this.icon,
      @required this.animationController});

  @override
  _MenuListTile createState() => _MenuListTile();
}

class _MenuListTile extends State<MenuListTile> {
  Animation<double> widthAnimation, sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 250, end: 60).animate(widget.animationController);
    sizedBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAnimation.value,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(widget.icon, color: Colors.white30, size: 38.0),
          SizedBox(width: sizedBoxAnimation.value),
          (widthAnimation.value >= 220)
              ? Text(widget.title, style: listTitleDefautTextStyle)
              : Container()
        ],
      ),
    );
  }
}
