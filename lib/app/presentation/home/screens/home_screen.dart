import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_clone/app/core/widgets/platform_appbar.dart';
import 'package:x_clone/app/core/widgets/platform_bottom_navigation_bar.dart';
import 'package:x_clone/app/core/widgets/platform_bottom_sheet.dart';
import 'package:x_clone/app/core/widgets/platform_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showCreateTweetSheet() {
    showPlatformBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.create),
                title: const Text('Create Tweet'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: 'Home',
        actions: [
          IconButton(
            icon: Icon(
              Platform.isIOS ? CupertinoIcons.add_circled : Icons.add_circle,
            ),
            onPressed: _showCreateTweetSheet,
          ),
        ],
      ),
      body: _buildContent(),
      bottomNavigationBar: PlatformBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return const Center(child: Text('Feed'));
      case 1:
        return const Center(child: Text('Search'));
      case 2:
        return const Center(child: Text('Profile'));
      default:
        return const Center(child: Text('Feed'));
    }
  }
}
