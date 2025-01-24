import 'package:test_firebase/features/chat/data/model/message_model.dart';

abstract class ChatRepo {
  void addMessage(
      {required String message,
      required String email,
      required DateTime dateTime});
}
