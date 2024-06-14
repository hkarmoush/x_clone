import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformBottomNavigationBar extends StatelessWidget {
  const PlatformBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTabBar(
            currentIndex: currentIndex,
            onTap: onTap,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.add),
                label: 'Create',
              ),
            ],
          )
        : BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Create',
              ),
            ],
          );
  }
}
