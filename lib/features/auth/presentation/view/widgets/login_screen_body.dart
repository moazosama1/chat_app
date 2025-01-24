import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:test_firebase/core/app_router.dart';
import 'package:test_firebase/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:test_firebase/features/chat/presentation/view_model/chat_cubit.dart';
import 'custom_button.dart';
import 'custom_text_from_field.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
        } else if (state is AuthFailure) {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else {
          isLoading =false;
          GoRouter.of(context).push(AppRouter.kHomeView, extra: email);
          BlocProvider.of<ChatCubit>(context).getMessages();
          BlocProvider.of<ChatCubit>(context).getEmail();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  CustomTextFromField(
                    hintText: "Email",
                    validate: cubit.validate,
                    onChange: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFromField(
                    hintText: "Password",
                    validate: cubit.validate,
                    onChange: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    textButton: "Login",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        cubit.loginAccount(email: email!, password: password!);

                      }
                    },
                    colorButton: Colors.blueAccent,
                  ),
                  const Spacer(),
                  CustomButton(
                    textButton: "Sign Up",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kRegisterView);
                    },
                    colorButton: Colors.deepOrange,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
