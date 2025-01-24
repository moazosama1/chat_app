import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/features/splash/presentation/view/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
