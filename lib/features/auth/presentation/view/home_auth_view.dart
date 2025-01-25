import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_firebase/features/auth/presentation/view/widgets/home_auth_body.dart';

class HomeAuthView extends StatelessWidget {
  const HomeAuthView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeAuthViewBody(),
    );
  }
}
