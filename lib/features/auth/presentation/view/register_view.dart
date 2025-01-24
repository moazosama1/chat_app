import 'package:flutter/material.dart';
import 'package:test_firebase/features/auth/presentation/view/widgets/register_screen_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: RegisterScreenBody(),
    );
  }
}
