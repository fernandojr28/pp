
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@immutable
class UserApp{

  final String id;
  final String token;
  final String email;
  final String lastName;
  final String name;
  final String picture;

  const UserApp({
    String? id,
    String? token,
    String? email,
    String? lastName,
    String? name,
    String? picture
  }) : id = id ?? "",
    token = token ?? "",
    email = email ?? "",
    lastName = email ?? "",
    name = email ?? "",
    picture = picture ?? "";

  UserApp copyWith({
    String? id,
    String? token,
    String? email,
    String? lastName,
    String? name,
    String? picture
  }) =>
      UserApp(
        id: id ?? this.id,
        token: token ?? this.token,
        email: email ?? this.email,
        lastName:  lastName ?? this.lastName,
        name:  name ?? this.name,
        picture: picture ?? this.picture
      );

  static UserApp withToken(String token) => UserApp(token: token);

  static UserApp fromJson(Map<String, dynamic>? json) {

    if(json == null) {
      return const UserApp();
    }

    return UserApp(
      id: json['id'].toString(),
      token: json['token'],
      email: json['email'],
      lastName: json['family_name'],
      name: json['given_name'],
      picture: json['picture'],
      
    );
  }

  dynamic toJson() => {
    'id': id,
    'token': token,
    'email': email,
    'lastName': lastName,
    'name': name,
    'picture': picture
  };
}