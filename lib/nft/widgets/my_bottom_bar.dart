import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key, required this.index, this.onTap});

  final int index;
  final Function(int?)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTap,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[300],
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: "Notifications"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
      ],
    );
  }
}
