
import '../helper/helper.dart';

enum MessageChatType {
  text(0),
  image(1),
  video(2),
  anotherFile(3);

  final int type;

  const MessageChatType(this.type);

  static int setMessageType(MessageChatType type) => switch (type) {
        MessageChatType.text => 0,
        MessageChatType.image => 1,
        MessageChatType.video => 2,
        MessageChatType.anotherFile => 3,
      };

  static MessageChatType getTypeMessage(int type) => switch (type) {
        0 => MessageChatType.text,
        1 => MessageChatType.image,
        2 => MessageChatType.video,
        3 => MessageChatType.anotherFile,
        _ => MessageChatType.text
      };
}

class ChatFileModel {
  final String fileName;
  final String fileType;
  final String fileUrl;

  ChatFileModel(
      {required this.fileName, required this.fileType, required this.fileUrl});

  Map<String, dynamic> toJson() {
    return {
      "fileName": this.fileName,
      "fileType": this.fileType,
      "fileUrl": this.fileUrl,
    };
  }

  factory ChatFileModel.fromJson(Map<dynamic, dynamic> json) {
    return ChatFileModel(
      fileName: json["fileName"],
      fileType: json["fileType"],
      fileUrl: json["fileUrl"],
    );
  }
}

class MessageChatFile {
  final List<ChatFileModel> lstFiles;
  final String message;

  MessageChatFile({required this.lstFiles, required this.message});

  Map<String, dynamic> toJson() {
    return {
      "chatFileModel": lstFiles.map((e) => e.toJson()).toList(),
      "message": this.message,
    };
  }

  factory MessageChatFile.fromJson(Map<dynamic, dynamic> json) {
    List<ChatFileModel> chatFileModel = [];
    json["chatFileModel"].forEach((element) {
      chatFileModel.add(ChatFileModel.fromJson(element));
    });
    return MessageChatFile(
      lstFiles: chatFileModel,
      message: json["message"],
    );
  }
}

class MessageChat {
  String groupChatId;
  String senderId;
  String receiverId;
  String timestamp;
  dynamic message;
  MessageChatType messageChatType;

  MessageChat({
    required this.groupChatId,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
    required this.message,
    required this.messageChatType,
  });

  Map<String, dynamic> toJson() {
    return {
      "senderId": this.senderId,
      "groupChatId": this.groupChatId,
      "receiverId": this.receiverId,
      "timestamp": this.timestamp,
      "message": this.message,
      "messageChatType": MessageChatType.setMessageType(this.messageChatType),
    };
  }

  factory MessageChat.fromJson(Map<dynamic, dynamic> json) {
    MessageChatType messageChatType =
        MessageChatType.getTypeMessage(json["messageChatType"]);
    return MessageChat(
        senderId: json["senderId"],
        groupChatId: json["groupChatId"],
        receiverId: json["receiverId"],
        timestamp: json["timestamp"],
        message: json["message"],
        messageChatType: messageChatType);
  }

  static MessageChat createMessageChat(
      {required String senderId,
      required String receiverId,
      required String groupChatId,
      required dynamic message,
      required MessageChatType messageChatType}) {
    return MessageChat(
        senderId: senderId,
        receiverId: receiverId,
        groupChatId: groupChatId,
        timestamp: createTimeStamp(),
        message: message,
        messageChatType: messageChatType);
  }
}
