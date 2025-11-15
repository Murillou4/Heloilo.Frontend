enum ResponseType {
  ok,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  internalError;

  static ResponseType fromString(String value) => ResponseType.values
      .firstWhere((e) => e.toString().split('.').last == value.toLowerCase());
}
