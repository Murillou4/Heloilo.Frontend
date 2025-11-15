import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Serviço local para armazenamento de dados.
/// - Usa `SharedPreferences` para itens não sensíveis (preferências simples)
/// - Usa `FlutterSecureStorage` para itens sensíveis (tokens, segredos)
/// Fornece providers Riverpod para fácil injeção e testabilidade.

class LocalDataService {
  LocalDataService._internal();
  static late final SharedPreferences prefs;
  static late final FlutterSecureStorage secureStorage;

  static final Logger _logger = Logger();

  static void _logError(String operation, Object error, StackTrace stack) {
    _logger.e('[LocalDataService] $operation', error: error, stackTrace: stack);
  }

  static Future<void> init() async {
    try {
      prefs = await SharedPreferences.getInstance();
      secureStorage = const FlutterSecureStorage();
    } catch (e, st) {
      _logError('init', e, st);
      rethrow;
    }
  }

  // --------------------- SharedPreferences (não sensível) ---------------------
  static Future<bool> setString(String key, String value) async {
    try {
      return await prefs.setString(key, value);
    } catch (e, st) {
      _logError('setString($key)', e, st);
      rethrow;
    }
  }

  static String? getString(String key) {
    try {
      return prefs.getString(key);
    } catch (e, st) {
      _logError('getString($key)', e, st);
      rethrow;
    }
  }

  static Future<bool> setInt(String key, int value) async {
    try {
      return await prefs.setInt(key, value);
    } catch (e, st) {
      _logError('setInt($key)', e, st);
      rethrow;
    }
  }

  static int? getInt(String key) {
    try {
      return prefs.getInt(key);
    } catch (e, st) {
      _logError('getInt($key)', e, st);
      rethrow;
    }
  }

  static Future<bool> setBool(String key, bool value) async {
    try {
      return await prefs.setBool(key, value);
    } catch (e, st) {
      _logError('setBool($key)', e, st);
      rethrow;
    }
  }

  static bool? getBool(String key) {
    try {
      return prefs.getBool(key);
    } catch (e, st) {
      _logError('getBool($key)', e, st);
      rethrow;
    }
  }

  static Future<bool> remove(String key) async {
    try {
      return await prefs.remove(key);
    } catch (e, st) {
      _logError('remove($key)', e, st);
      rethrow;
    }
  }

  static Future<bool> clear() async {
    try {
      return await prefs.clear();
    } catch (e, st) {
      _logError('clear', e, st);
      rethrow;
    }
  }

  // --------------------- FlutterSecureStorage (sensível) ---------------------
  static Future<void> writeSecure(String key, String value) async {
    try {
      await secureStorage.write(key: key, value: value);
    } catch (e, st) {
      _logError('writeSecure($key)', e, st);
      rethrow;
    }
  }

  static Future<String?> readSecure(String key) async {
    try {
      return await secureStorage.read(key: key);
    } catch (e, st) {
      _logError('readSecure($key)', e, st);
      rethrow;
    }
  }

  static Future<void> deleteSecure(String key) async {
    try {
      await secureStorage.delete(key: key);
    } catch (e, st) {
      _logError('deleteSecure($key)', e, st);
      rethrow;
    }
  }

  static Future<void> deleteAllSecure() async {
    try {
      await secureStorage.deleteAll();
    } catch (e, st) {
      _logError('deleteAllSecure', e, st);
      rethrow;
    }
  }
}
