import 'package:firebase_auth/firebase_auth.dart';

import 'cart_model.dart';

const ROLE_USER = 'role_user';
const ROLE_ADMIN = 'role_admin';

enum UserType {
  Sliver('Member Sliver', 0),
  Gold('Member Gold', 1),
  Platinum('Member Platinum', 2),
  Diamond('Member Diamond', 3),
  Owners('Restaurant Owners', 4);
  final String name;
  final int json;
  const UserType(this.name, this.json);
}

class UserModel {
  String uid;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? photoUrl;
  String? address;
  String? role;
  String? createType;
  List<String> playerIds;
  UserType? userType;
  double? serviceFee = 6.0;
  List<int> favoriteIds;
  List<CartModel> carts;
  List<String> orderIds;
  List<String> commentIds = [];

  UserModel(
      {required this.uid,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.photoUrl,
      this.address,
      required this.orderIds,
      this.role,
      this.createType,
      this.userType,
      required this.carts,
      required this.commentIds,
      required this.favoriteIds,
      required this.playerIds});

  static UserModel createAdminByAuthUser(
      {required User authUser, required createType}) {
    return UserModel(
      uid: authUser.uid,
      orderIds: [],
      email: authUser.email,
      photoUrl: authUser.photoURL,
      phoneNumber: authUser.phoneNumber,
      firstName: authUser.displayName,
      userType: UserType.Owners,
      role: ROLE_ADMIN,
      favoriteIds: [],
      commentIds: [],
      carts: [],
      playerIds: [],
      createType: createType,
    );
  }

  bool isUser() => role == ROLE_USER;

  bool isAdmin() => role == ROLE_ADMIN;

  String getName() => (firstName ?? '');

  double get getServiceFee => serviceFee ?? 0.0;

  UserModel.fromJson(Map<String, dynamic> data)
      : uid = data['uid'] ?? '',
        firstName = data['firstName'] ?? '',
        lastName = data['lastName'] ?? '',
        phoneNumber = data['phoneNumber'] ?? '',
        email = data['email'] ?? '',
        photoUrl = data['photoUrl'] ?? '',
        address = data['address'] ?? '',
        role = data['role'] ?? '',
        commentIds = List<String>.from(data['commentIds'] ?? []),
        playerIds = List<String>.from(data['playerIds'] ?? []),
        createType = data['createType'] ?? '',
        favoriteIds = List<int>.from(data['favoriteIds'] ?? []),
        orderIds = List<String>.from(data['orderIds'] ?? []),
        carts = List<CartModel>.from(
            data['carts']?.map((x) => CartModel.fromJson(x)) ?? []),
        userType = UserType.values[data['userType'] ?? 0];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'photoUrl': photoUrl,
      'address': address,
      'role': role,
      'createType': createType,
      'playerIds': playerIds,
      'commentIds': commentIds,
      'orderIds': orderIds,
      'carts': carts.map((x) => x.toJson()).toList(),
      'favoriteIds': favoriteIds,
      'userType': userType?.json,
    };
  }

  addPlayerId(String playerId) {
    if (playerIds.contains(playerId)) {
      return;
    }

    playerIds.add(playerId);
  }

  UserModel copyWith({
    String? fullName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? photoUrl,
    String? address,
    List<CartModel>? carts,
    List<String>? playerIds,
    List<String>? orderIds,
    UserType? userType,
    List<int>? favoriteIds,
    List<String>? commentIds,
  }) {
    return UserModel(
      uid: this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      address: address ?? this.address,
      orderIds: orderIds ?? this.orderIds,
      role: this.role,
      createType: this.createType,
      playerIds: playerIds ?? this.playerIds,
      favoriteIds: favoriteIds ?? this.favoriteIds,
      commentIds: commentIds ?? this.commentIds,
      userType: userType ?? this.userType,
      carts: carts ?? this.carts,
    );
  }
}
