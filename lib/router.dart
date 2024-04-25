import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/common/main_navigation_screen.dart';
import 'package:navigator/features/authentication/views/agreement_screen.dart';
import 'package:navigator/features/authentication/views/login_screen.dart';
import 'package:navigator/features/authentication/views/sign_up_screen.dart';
import 'package:navigator/features/onboarding/views/onboarding_screen.dart';
import 'package:navigator/features/survey/views/survey_screen.dart';

final GoRouter router = GoRouter(
  // initialLocation: "/home",
  routes: [
    GoRoute(
      name: OnboardingScreen.routeName,
      path: OnboardingScreen.routeURL,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: AgreementScreen.routeName,
      path: AgreementScreen.routeURL,
      builder: (context, state) => const AgreementScreen(),
    ),
    GoRoute(
      name: SurveyScreen.routeName,
      path: SurveyScreen.routeURL,
      builder: (context, state) => const SurveyScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/:tab(calendar|home|contents|users)",
      name: MainNavigationScreen.routeName,
      pageBuilder: (context, state) {
        final tab = state.pathParameters['tab']!;

        return CustomTransitionPage(
          transitionDuration: Duration(
            milliseconds: 200,
          ),
          child: MainNavigationScreen(tab: tab),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final position = Tween(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation);
            return SlideTransition(
              position: position,
              child: child,
            );
          },
        );
      },
    )
  ],
);
