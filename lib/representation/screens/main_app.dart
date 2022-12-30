import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travo/core/constants/color_constants.dart';
import 'package:travo/core/constants/dimension_constants.dart';
import 'package:travo/representation/screens/home_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  static const String routeName = '/main';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  int _currentTabIndex = 0;

  void focusedTabHandler(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBackgroundColor,
      body: IndexedStack(
        index: _currentTabIndex,
        children: [
          HomeScreen(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.orangeAccent,
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentTabIndex,
        onTap: focusedTabHandler,
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        margin: const EdgeInsets.symmetric(
          horizontal: AppDimension.kMediumPadding,
          vertical: AppDimension.kMediumPadding,
        ),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.house,
              size: AppDimension.kDefaultIconSize,
            ),
            title: const Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidHeart,
              size: AppDimension.kDefaultIconSize,
            ),
            title: const Text('Likes'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.briefcase,
              size: AppDimension.kDefaultIconSize,
            ),
            title: const Text('Booking'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidUser,
              size: AppDimension.kDefaultIconSize,
            ),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}
