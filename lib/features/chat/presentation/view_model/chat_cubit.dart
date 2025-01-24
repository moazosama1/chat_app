import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_firebase/features/chat/data/model/message_model.dart';
import 'package:test_firebase/features/chat/data/repo/chat_repo_impl.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<MessageModel> listMessage = [];
  final ChatRepoImpl chatRepoImpl = ChatRepoImpl();
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  CollectionReference messages =
  FirebaseFirestore.instance.collection("messages");
  String? email;
  void getEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email");
  }

  void addMessage(
      {required String message, required DateTime dateTime}) {
    chatRepoImpl.addMessage(message: message, email: email!, dateTime: dateTime);
    controller.clear();
    scrollDown();
  }

  void getMessages() {
    try {
        messages.orderBy("createdAt" ,descending: true).snapshots().listen(
            (event) {
              listMessage.clear();
          for (var doc in event.docs) {
            listMessage.add(MessageModel.fromJson(doc));
          }
          emit(ChatSuccess(listMessages: listMessage));
        },
      );
    } on Exception catch (e) {
      print(e.toString());
    }
  }
  // void getMessages() {
  //   chatRepoImpl.getMessagesFromFirebase().listen(
  //         (listMessage) {
  //       emit(ChatSuccess(listMessages: listMessage));
  //     },
  //     onError: (error) {
  //     },
  //   );
  // }

  void scrollDown() {
    scrollController.animateTo(0,
        duration: const Duration(microseconds: 500), curve: Curves.easeIn);
  }
}
