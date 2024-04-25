import 'package:flutter/material.dart';

class SurveyScreen extends StatefulWidget {
  static String routeName = "survey";
  static String routeURL = "/survey";
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("사전검사"),
      ),
    );
  }
}
