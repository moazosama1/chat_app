import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_firebase/features/chat/data/repo/chat_repo.dart';

class ChatRepoImpl extends ChatRepo {
  CollectionReference users = FirebaseFirestore.instance.collection('messages');
  @override
  void addMessage(
      {required String message,
      required String email,
      required DateTime dateTime}) {
    users.add({"message": message, 'createdAt': dateTime, 'id': email});
  }
}
