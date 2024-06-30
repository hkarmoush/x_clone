import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    if (index == 3) {
      context.go('/create-tweet');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
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

  void _navigateToProfile() {
    context
        .go('/profile/myUserId'); // Replace 'myUserId' with the actual user ID
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
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _navigateToProfile,
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
