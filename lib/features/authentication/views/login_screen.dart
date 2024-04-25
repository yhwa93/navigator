import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/features/authentication/views/login_form_screen.dart';
import 'package:navigator/features/authentication/views/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login";
  static String routeURL = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _onEmailTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
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
              Text("로그인 방법 선택하기"),
              GestureDetector(
                onTap: _onEmailTap,
                child: Text(
                  '이메일로 시작하기(이메일 로그인)',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.pushNamed(SignUpScreen.routeName),
                    child: Text('회원가입'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('비밀번호 찾기'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
