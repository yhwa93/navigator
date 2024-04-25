import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/features/calendar/views/calendar_screen.dart';
import 'package:navigator/features/contents/views/contents_screen.dart';
import 'package:navigator/features/home/views/home_screen.dart';
import 'package:navigator/features/users/views/mypage.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "calendar", 
    "home", 
    "contents",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);
  late bool _hideSidemenu = true;

  void _onTap(int index) {
    context.go("/${_tabs[index]}");

    setState(() {
      _selectedIndex = index;
      _hideSidemenu = true;
    });
  }

  void _onSidemenuTap(){
    context.go("/mypage");

    setState(() {
      _hideSidemenu = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _onSidemenuTap,
          ),
        ],
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const CalendarScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const ContentsScreen(),
          ),
           Offstage(
            offstage: _hideSidemenu,
            child: const MyPageScreen(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: "캘린더",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.puzzlePiece),
            label: "콘텐츠",
          ),
        ],
      ),
    );
  }
}
