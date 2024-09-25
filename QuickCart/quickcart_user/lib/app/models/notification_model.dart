import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:uuid/uuid.dart';

import '../helper/helper.dart';

enum NotificationType {
  order('order'),
  chat('chat'),
  other('other');

  final String json;
  const NotificationType(this.json);

  static NotificationType parseJson(String json) => switch (json) {
        'order' => NotificationType.order,
        'chat' => NotificationType.chat,
        _ => NotificationType.other
      };
}

class NotificationModel {
  final String uid;
  final String receiverId; // is uid
  final String title;
  final String message;
  final String image;
  final NotificationType type;
  final bool isRead;
  final String createAt;

  // support type chat
  final String? groupChatId;

  // support type order
  final String? orderId;

  NotificationModel(
      {required this.uid,
      this.groupChatId,
      this.orderId,
      required this.receiverId,
      required this.createAt,
      required this.title,
      required this.isRead,
      required this.message,
      required this.image,
      required this.type});

  // From json
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        uid: json['uid'],
        receiverId: json['receiverId'],
        title: json['title'],
        orderId: json['orderId'],
        groupChatId: json['groupChatId'],
        message: json['message'],
        isRead: json['isRead'],
        createAt: json['createAt'],
        image: json['image'],
        type: NotificationType.parseJson(json['type']));
  }

  // to Json
  Map<String, dynamic> toJson() => {
        'receiverId': receiverId,
        'uid': uid,
        'isRead': isRead,
        'orderId': orderId,
        'title': title,
        'groupChatId': groupChatId,
        'createAt': createAt,
        'message': message,
        'image': image,
        'type': type.json
      };

  static NotificationModel createNotificationModelByOSCreateNotification(
      {required OSCreateNotification notification,
      required String receiverId,
      required NotificationType type,
      String? groupChatId,
      String? orderId,
      String? image}) {
    return NotificationModel(
        uid: const Uuid().v4(),
        createAt: createTimeStamp(),
        isRead: false,
        receiverId: receiverId,
        orderId: orderId,
        groupChatId: groupChatId,
        title: notification.heading ?? '',
        message: notification.content ?? '',
        image: image ?? notification.bigPicture ?? '',
        type: type);
  }

  // change isRead
  NotificationModel changeIsRead(bool isRead) {
    return NotificationModel(
        uid: uid,
        receiverId: receiverId,
        groupChatId: groupChatId,
        title: title,
        createAt: createAt,
        message: message,
        isRead: isRead,
        orderId: orderId,
        image: image,
        type: type);
  }
}
