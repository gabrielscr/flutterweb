import 'package:flutter/material.dart';

class MenuNavigation {
  String title;
  IconData icon;

  MenuNavigation({this.title, this.icon});
}

List<MenuNavigation> menuNavigationItems = [
  MenuNavigation(title: "Início", icon: Icons.home),
  MenuNavigation(title: "Produtos", icon: Icons.inbox),
  MenuNavigation(title: "Perfil", icon: Icons.person_pin),
  MenuNavigation(title: "Configurações", icon: Icons.settings)
];
