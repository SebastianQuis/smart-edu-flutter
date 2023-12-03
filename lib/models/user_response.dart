// import 'dart:convert';

// import 'package:smart_edu_app/models/models.dart';

// class UserResponse {
//     final UserModel userModel;
//     String? id;

//     UserResponse({
//       required this.userModel,
//       this.id,
//     });

//     factory UserResponse.fromRawJson(String str) => UserResponse.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
//         userModel: UserModel.fromJson(json["id"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": userModel.toJson(),
//     };
// }