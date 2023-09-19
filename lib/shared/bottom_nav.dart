import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookOpen, size: 20), label: 'Styles'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user, size: 20), label: 'Profile')
      ],
      fixedColor: Colors.deepOrange,
      onTap: (int idx) {
        switch (idx) {
          case 0:
            Navigator.pushNamed(context, '/styles');
            break;
          case 1:
            Navigator.pushNamed(context, '/profile');
            break;
          
        }
      },
    );
  }
}
