import 'package:blog_app/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.name});

  //to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

  //from map
  factory UserModel.fromMap(Map<String, dynamic>? map) {
    return UserModel(
      id: map?['id'] ?? '',
      email: map?['email'] ?? "",
      name: map?['name'] ?? "",
    );
  }

  //to json

  String toJson() => '''
  {
    "id": "$id",
    "email": "$email",
    "name": "$name"
  }
  ''';


  //from json
  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel.fromMap(json);
  }
}
