// ignore_for_file: file_names

import 'package:apk_terjemahan/screens/enind_Screen.dart';
import 'package:apk_terjemahan/screens/inden_Screen.dart';
import 'package:apk_terjemahan/screens/javin_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: Colors.deepPurple,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded),
              label: 'IndEn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded),
              label: 'EnInd',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded),
              label: 'javIn',
            ),
          ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: indEnScreen(),
                );
              },
            );

          case 1:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: enIndScreen(),
                );
              },
            );

          case 2:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: javInScreen(),
                );
              },
            );
        }
        return Container();
      },
    );
  }
}
