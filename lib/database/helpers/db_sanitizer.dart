String sanitizeSQL(dynamic param) {
  String sanitize = param.toString();

  return sanitize
    ..replaceAll(RegExp('\'', caseSensitive: false), '')
    ..replaceAll(RegExp('"', caseSensitive: false), '')
    ..replaceAll(RegExp('drop', caseSensitive: false), '')
    ..replaceAll(RegExp('insert', caseSensitive: false), '')
    ..replaceAll(RegExp('delete', caseSensitive: false), '')
    ..replaceAll(RegExp('update', caseSensitive: false), '')
    ..replaceAll(RegExp('create', caseSensitive: false), '');
}
