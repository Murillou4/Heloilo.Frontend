import 'package:heloilo/data/models/auth.dart';
import 'package:heloilo/data/models/user.dart';

class SignInDto {
  final String email;
  final String password;

  SignInDto({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }
}

class SignUpDto {
  final String email;
  final String password;
  final String name;
  final String nickname;

  SignUpDto({
    required this.email,
    required this.password,
    required this.name,
    required this.nickname,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'nickname': nickname,
    };
  }
}

class AuthResponseDto {
  final User user;
  final Auth auth;

  AuthResponseDto({required this.user, required this.auth});

  factory AuthResponseDto.fromResponse(Map<String, dynamic> map) {
    return AuthResponseDto(
      user: User.fromMap(map['user']),
      auth: Auth.fromMap(map),
    );
  }
}
