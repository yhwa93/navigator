import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator/features/authentication/widgets/form_button.dart';
import 'package:navigator/features/home/views/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeURL = "/signUp";
  static const routeName = "signUp";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Map<String, String> formData = {};
  bool isChecked = false;
  bool isAllChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              '아래 정보를 입력하세요',
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
                        hintText: '사용자 이름',
                      ),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (newValue) => {
                        if (newValue != null) {formData['username'] = newValue}
                      },
                    ),
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
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '비밀번호 확인',
                      ),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (newValue) => {
                        if (newValue != null)
                          {formData['password_confirm'] = newValue}
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isAllChecked,
                              onChanged: (bool? value) => setState(
                                () {
                                  isAllChecked = value!;
                                },
                              ),
                            ),
                            const Text('전체 동의'),
                          ],
                        ),
                        const Divider(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) => setState(
                                () {
                                  isChecked = value!;
                                },
                              ),
                            ),
                            const Text('[필수 01] 동의하기 (노션 링크)'),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) => setState(
                                () {
                                  isChecked = value!;
                                },
                              ),
                            ),
                            const Text('[필수 02] 동의하기 (노션 링크)'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => context.go(HomeScreen.routeURL),
              child: const FormButton(disabled: false),
            ),
          ],
        ),
      ),
    );
  }
}
