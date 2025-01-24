import 'package:flutter/material.dart';
import 'package:test_firebase/features/auth/presentation/view/widgets/login_screen_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LoginScreenBody(),
    );
  }
}
