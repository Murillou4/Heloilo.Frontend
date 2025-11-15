// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String email;
  final String name;
  final String nickname;
  final String? themeColor;
  final bool hasRelationship;
  final bool hasProfilePhoto;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.nickname,
    this.themeColor,
    this.hasRelationship = false,
    this.hasProfilePhoto = false,
    required this.createdAt,
  });

  User copyWith({
    int? id,
    String? email,
    String? name,
    String? nickname,
    String? themeColor,
    bool? hasRelationship,
    bool? hasProfilePhoto,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      themeColor: themeColor ?? this.themeColor,
      hasRelationship: hasRelationship ?? this.hasRelationship,
      hasProfilePhoto: hasProfilePhoto ?? this.hasProfilePhoto,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'nickname': nickname,
      'themeColor': themeColor,
      'hasRelationship': hasRelationship,
      'hasProfilePhoto': hasProfilePhoto,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      name: map['name'] as String,
      nickname: map['nickname'] as String,
      themeColor: map['themeColor'] != null
          ? map['themeColor'] as String
          : null,
      hasRelationship: map['hasRelationship'] as bool? ?? false,
      hasProfilePhoto: map['hasProfilePhoto'] as bool? ?? false,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, nickname: $nickname, themeColor: $themeColor, hasRelationship: $hasRelationship, hasProfilePhoto: $hasProfilePhoto, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.name == name &&
        other.nickname == nickname &&
        other.themeColor == themeColor &&
        other.hasRelationship == hasRelationship &&
        other.hasProfilePhoto == hasProfilePhoto &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        nickname.hashCode ^
        themeColor.hashCode ^
        hasRelationship.hashCode ^
        hasProfilePhoto.hashCode ^
        createdAt.hashCode;
  }
}
