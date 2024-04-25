import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/features/authentication/views/login_form_screen.dart';
import 'package:navigator/features/authentication/views/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeURL = "/";
  static const routeName = "onboarding";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void _onEmailTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('온보딩 튜토리얼'),
              GestureDetector(
                onTap: () => context.pushNamed(LoginScreen.routeName),
                child: Text("시작하기(로그인하기) 👉"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
