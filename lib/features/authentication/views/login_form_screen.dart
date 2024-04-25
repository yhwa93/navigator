import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/features/authentication/widgets/form_button.dart';
import 'package:navigator/features/home/views/home_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              '이랏샤이마세 :)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '이메일',
                      ),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (newValue) => {
                        if (newValue != null) {formData['email'] = newValue}
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '비밀번호',
                      ),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (newValue) => {
                        if (newValue != null) {formData['password'] = newValue}
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () => context.go(HomeScreen.routeURL),
                      child: const FormButton(disabled: false),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
