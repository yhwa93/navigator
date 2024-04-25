import 'package:flutter/material.dart';

class MyPageScreen extends StatefulWidget {
  static String routeName = "mypage";
  static String routeURL = "/mypage";
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Mypage'),
    );
  }
}
