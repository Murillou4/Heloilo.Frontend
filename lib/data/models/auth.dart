// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Auth {
  String token;
  String refreshToken;
  DateTime expiresAt;

  Auth({
    required this.token,
    required this.refreshToken,
    required this.expiresAt,
  });

  Auth copyWith({String? token, String? refreshToken, DateTime? expiresAt}) {
    return Auth(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'refreshToken': refreshToken,
      'expiresAt': expiresAt.toIso8601String(),
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
      expiresAt: DateTime.parse(map['expiresAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) =>
      Auth.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Auth(token: $token, refreshToken: $refreshToken, expiresAt: $expiresAt)';

  @override
  bool operator ==(covariant Auth other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.refreshToken == refreshToken &&
        other.expiresAt == expiresAt;
  }

  @override
  int get hashCode =>
      token.hashCode ^ refreshToken.hashCode ^ expiresAt.hashCode;
}
