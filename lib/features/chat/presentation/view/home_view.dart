import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_firebase/core/app_router.dart';
import 'package:test_firebase/features/chat/presentation/view/widgets/home_screen_body.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key, required this.email});
  String email;
  String? newEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: ()async {
            FirebaseAuth.instance.signOut();
            SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
            sharedPreferences.remove("email");
            GoRouter.of(context).push(AppRouter.kLoginView);
          },
            child: const Icon(
          Icons.logout,
          color: Colors.white,
          size: 25,
        )),
        backgroundColor: Colors.blueAccent,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
      body: HomeScreenBody(
        email: email,
      ),
    );
  }
}
