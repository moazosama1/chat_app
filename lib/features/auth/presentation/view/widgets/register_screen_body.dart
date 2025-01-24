import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:test_firebase/features/auth/presentation/view_model/auth_cubit.dart';
import '../../../../../core/app_router.dart';
import '../../../../chat/presentation/view_model/chat_cubit.dart';
import 'custom_button.dart';
import 'custom_text_from_field.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          isLoading = false;
          GoRouter.of(context).push(AppRouter.kHomeView , extra: email);
          BlocProvider.of<ChatCubit>(context).getMessages();
          BlocProvider.of<ChatCubit>(context).getEmail();
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else {
            isLoading = true;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    CustomTextFromField(
                      hintText: "Name",
                      validate:cubit.validate,
                    ),
                    const SizedBox(
                      height: 20,
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
                      hintText: "Phone",
                      validate: cubit.validate,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFromField(
                      hintText: "Password",
                      validate:cubit.validate,
                      onChange: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      textButton: "Create",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          cubit.registerAccount(
                              email: email!, password: password!);
                        }
                      },
                      colorButton: Colors.amber,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    CustomButton(
                      textButton: "Go to Login",
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      colorButton: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
