import 'package:flutter/material.dart';

class AgreementScreen extends StatefulWidget {
  static const routeURL = "/agreement";
  static const routeName = "agreement";
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("개인정보 동의하기"),
        ),
      ),
    );
  }
}
