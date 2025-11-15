// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:heloilo/core/shared/models/response_type.dart';

class ApiResponse {
  final ResponseType type;
  final String message;
  final String title;
  final int status;
  final Map<String, dynamic>? data;
  final String extendedResultCode;
  final DateTime date;

  ApiResponse({
    required this.type,
    required this.message,
    required this.title,
    required this.status,
    this.data,
    required this.extendedResultCode,
    required this.date,
  });

  ApiResponse copyWith({
    ResponseType? type,
    String? message,
    String? title,
    int? status,
    Map<String, dynamic>? data,
    String? extendedResultCode,
    DateTime? date,
  }) {
    return ApiResponse(
      type: type ?? this.type,
      message: message ?? this.message,
      title: title ?? this.title,
      status: status ?? this.status,
      data: data ?? this.data,
      extendedResultCode: extendedResultCode ?? this.extendedResultCode,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.toString(),
      'message': message,
      'title': title,
      'status': status,
      'data': data,
      'extendedResultCode': extendedResultCode,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    try {
      // 1. Lemos o tipo primeiro para decidir
      final type = ResponseType.fromString(map['type'] as String);

      // 2. Se for 'ok', criamos um ApiResponseSuccess
      if (type == ResponseType.ok) {
        return ApiResponseSuccess(
          type: type,
          message: map['message'] as String,
          title: map['title'] as String,
          status: map['status'] as int,
          data: map['data'], // Sucesso inclui dados
          extendedResultCode: map['extendedResultCode'] as String,
          date: DateTime.parse(map['date'] as String), // API Doc usa ISO String
        );
      } else {
        // 3. Se for qualquer outro tipo, criamos um ApiResponseError
        return ApiResponseError(
          type: type,
          message: map['message'] as String,
          title: map['title'] as String,
          status: map['status'] as int,
          extendedResultCode: map['extendedResultCode'] as String,
          date: DateTime.parse(map['date'] as String), // API Doc usa ISO String
        );
      }
    } catch (e) {
      // 4. Se tudo falhar (ex: 'type' não existe), retorne um Erro Padrão
      return ApiResponseError(
        type: ResponseType.internalError,
        message: "Serviço indisponível ou resposta inválida",
        title: 'Erro de Deserialização',
        status: 500,
        // Erro não tem 'data' no construtor, mas o pai tem
        extendedResultCode: '#FATAL',
        date: DateTime.now(),
      );
    }
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiResponse(type: $type, message: $message, title: $title, status: $status, data: $data, extendedResultCode: $extendedResultCode, date: $date)';
  }

  @override
  bool operator ==(covariant ApiResponse other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.message == message &&
        other.title == title &&
        other.status == status &&
        mapEquals(other.data, data) &&
        other.extendedResultCode == extendedResultCode &&
        other.date == date;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        message.hashCode ^
        title.hashCode ^
        status.hashCode ^
        data.hashCode ^
        extendedResultCode.hashCode ^
        date.hashCode;
  }
}

class ApiResponseError extends ApiResponse {
  ApiResponseError({
    required super.type,
    required super.message,
    required super.title,
    required super.status,
    required super.extendedResultCode,
    required super.date,
  });
}

class ApiResponseSuccess extends ApiResponse {
  ApiResponseSuccess({
    required super.type,
    required super.message,
    required super.title,
    required super.status,
    required super.data,
    required super.extendedResultCode,
    required super.date,
  });
}

// 1. Defina sua classe de falha
class AppFailure {
  final String message;
  final String? extendedResultCode;
  AppFailure(this.message, this.extendedResultCode);

  @override
  String toString() => message;
}

// 2. Crie a classe 'Result' selada
sealed class Result<T> {
  /// Retorna true se o resultado for [Failure]
  bool get isFailure => this is Failure<T>;

  /// Retorna true se o resultado for [Success]
  bool get isSuccess => this is Success<T>;

  /// Helper para obter o erro (retorna nulo se for Sucesso)
  AppFailure? get error {
    if (this is Failure<T>) {
      return (this as Failure<T>).error;
    }
    return null;
  }

  /// Helper para obter os dados (retorna nulo se for Falha)
  T? get data {
    if (this is Success<T>) {
      return (this as Success<T>).data;
    }
    return null;
  }
}

// 3. O estado de Sucesso
class Success<T> extends Result<T> {
  @override // <-- ADICIONE ESTA LINHA
  final T data;

  Success(this.data);
}

// 4. O estado de Falha
class Failure<T> extends Result<T> {
  @override
  final AppFailure error;

  Failure(this.error);
}
