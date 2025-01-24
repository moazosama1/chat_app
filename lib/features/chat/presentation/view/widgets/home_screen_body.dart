import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_firebase/features/chat/data/model/message_model.dart';
import 'package:test_firebase/features/chat/presentation/view/widgets/custom_textField.dart';
import 'package:test_firebase/features/chat/presentation/view_model/chat_cubit.dart';

import 'custom_message.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({super.key, required this.email});

  String email;
  List<MessageModel> listMessage = [];
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ChatCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var cubit = BlocProvider.of<ChatCubit>(context);
                return ListView.separated(
                    reverse: true,
                    controller: cubit.scrollController,
                    itemBuilder: (context, index) => CustomMessage(
                          sender: cubit.listMessage[index].id == email,
                          text: cubit.listMessage[index].message,
                          dateTime: cubit.listMessage[index].dateTime,
                        ),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: cubit.listMessage.length);
              },
            ),
          ),
          CustomTextField(
            controller: cubit.controller,
            onSubmitted: (data) {
              cubit.addMessage(message: data, dateTime: DateTime.now());
            },
            onPressed: () {
              cubit.addMessage(
                  message: cubit.controller.text, dateTime: DateTime.now());
            },
          )
        ],
      ),
    );
  }
}
