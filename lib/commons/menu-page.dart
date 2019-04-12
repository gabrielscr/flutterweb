import 'package:flutter/material.dart';
import 'package:flutterweb/commons/menu-list-tile.dart';
import 'package:flutterweb/model/menu-navigation.dart';
import 'package:flutterweb/theme.dart';

class MenuPage extends StatefulWidget {
  @override
  MenuPageState createState() {
    return new MenuPageState();
  }
}

class MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget(context, widget));
  }

  Widget getWidget(context, widget) {
    return Container(
      width: widthAnimation.value,
      color: drawerBackgroundColor,
      child: Column(
        children: <Widget>[
          MenuListTile(
              title: 'Gabriel Rocha',
              icon: Icons.person,
              animationController: _animationController),
              Divider(color: Colors.grey, height: 40.0),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, counter) {
                return Divider(height: 5.0);
              },
              itemBuilder: (context, counter) {
                return MenuListTile(
                    title: menuNavigationItems[counter].title,
                    icon: menuNavigationItems[counter].icon,
                    animationController: _animationController);
              },
              itemCount: menuNavigationItems.length,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
                isCollapsed
                    ? _animationController.forward()
                    : _animationController.reverse();
              });
            },
            child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white,
                size: 40.0),
          ),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }
}
