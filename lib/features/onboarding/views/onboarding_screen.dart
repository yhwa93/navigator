import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/common/widgets/video_config.dart';
import 'package:navigator/features/authentication/views/login_form_screen.dart';
import 'package:navigator/features/authentication/views/login_screen.dart';
import 'package:provider/provider.dart';

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
              const Text('온보딩 튜토리얼 -> config2 : '),
              AnimatedBuilder(
                animation: videoConfig2,
                builder: (context, child) => SwitchListTile(
                  value: videoConfig2.value,
                  onChanged: (value) {
                    videoConfig2.value = !videoConfig2.value;
                  },
                ),
              ),
              AnimatedBuilder(
                animation: videoConfig,
                builder: (context, child) => SwitchListTile(
                  value: videoConfig.autoMute,
                  onChanged: (value) {
                    videoConfig.toggleAutoMute();
                  },
                ),
              ),
              GestureDetector(
                onTap: () => context.pushNamed(LoginScreen.routeName),
                child: const Text("시작하기(로그인하기) 👉"),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => context.read<VideoConfig3>().toggleisMuted(),
                child: Text(
                  context.watch<VideoConfig3>().isMuted
                      ? 'Provider: isMuted: TRUE'
                      : 'Provider: isMuted: FALSE',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => context.read<VideoConfig3>().toggleAutoplay(),
                child: Text(
                  context.watch<VideoConfig3>().isAutoplay
                      ? 'Provider: isAutoplay: TRUE'
                      : 'Provider: isAutoplay: FALSE',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
