import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/screens/tutorpages/tutor.dart';
import 'package:learningapp/screens/subjectpages/subject.dart';
import 'package:learningapp/screens/resourcespage/resource.dart';
import 'package:learningapp/screens/homepages/homepage2.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary:Color(0xFF7D7CC9),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.collections_bookmark),
        activeColorPrimary:Color(0xFF7D7CC9),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.groups_2_rounded),
        activeColorPrimary:Color(0xFF7D7CC9),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.file_copy_sharp),
        activeColorPrimary: Color(0xFF7D7CC9),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      HomePage2(),
      SubjectPage1(),
      TutorPage(),
      Resourcepage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
   
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, 
      stateManagement: true, 
      hideNavigationBarWhenKeyboardShows:
          true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6,
    );
  }
}
