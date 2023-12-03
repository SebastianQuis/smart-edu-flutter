import 'dart:convert';

class LoginResponse {
    final String kind;
    final String localId;
    final String email;
    final String displayName;
    final String idToken;
    final bool registered;

    LoginResponse({
        required this.kind,
        required this.localId,
        required this.email,
        required this.displayName,
        required this.idToken,
        required this.registered,
    });

    factory LoginResponse.fromRawJson(String str) => LoginResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        kind: json["kind"],
        localId: json["localId"],
        email: json["email"],
        displayName: json["displayName"],
        idToken: json["idToken"],
        registered: json["registered"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "localId": localId,
        "email": email,
        "displayName": displayName,
        "idToken": idToken,
        "registered": registered,
    };
}
