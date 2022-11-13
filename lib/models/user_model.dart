import 'dart:convert';

class UserModel {
    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.token,
    });

    int id;
    String name;
    String email;
    String token;

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "token": token,
    };
}
