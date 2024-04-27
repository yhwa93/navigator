import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/common/widgets/video_config.dart';
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

  bool _autoMute = videoConfig.autoMute;
  bool _autoMute2 = videoConfig2.value;

  @override
  void initState() {
    super.initState();

    videoConfig.addListener(() {
      setState(() {
        _autoMute = videoConfig.autoMute;
      });
    });

    //222
    videoConfig2.addListener(() {
      setState(() {
        _autoMute2 = videoConfig2.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => videoConfig2.value = !videoConfig2.value,
                child: Text(
                  _autoMute2 ? 'config2: 온!' : 'config2: 오프!!',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => videoConfig.toggleAutoMute(),
                child: Text(
                  _autoMute ? 'config1: 온!' : 'config1: 오프!!',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              const Text("로그인 방법 선택하기"),
              GestureDetector(
                onTap: _onEmailTap,
                child: const Text(
                  '이메일로 시작하기(이메일 로그인)',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.pushNamed(SignUpScreen.routeName),
                    child: const Text('회원가입'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('비밀번호 찾기'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
