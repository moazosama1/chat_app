import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_firebase/core/app_router.dart';
import 'package:test_firebase/features/chat/presentation/view_model/chat_cubit.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String? user = sharedPreferences.getString("email");
        if (user != null) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          GoRouter.of(context).push(AppRouter.kHomeView, extra: user);
          print(user);
        } else {
          GoRouter.of(context).push(AppRouter.kHomeAuthView);
        }
      },
    );
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            CupertinoIcons.chat_bubble_2,
            size: 60,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
