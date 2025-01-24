class MessageModel {
  String message;
  dynamic dateTime;
  String id;
  MessageModel(
      {required this.message, required this.dateTime, required this.id});
  factory MessageModel.fromJson(json) {
    return MessageModel(
        message: json["message"], dateTime: json["createdAt"], id: json["id"]);
  }
}
