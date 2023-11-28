import '../local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<bool> contains(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<String?> read(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.getString(key);
  }

  @override
  Future<List<String>?> readAll(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.getStringList(key);
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await _instance;
    await sharedPreferences.remove(key);
    
  }

  @override
  Future<void> write<V>(String key, V value) async {
    final sharedPreferences = await _instance;

    switch (V) {
      case String:
        await sharedPreferences.setString(key, value as String);
        break;
      case const (List<String>):
        await sharedPreferences.setStringList(key, value as List<String>);
        break;
      case int:
        await sharedPreferences.setInt(key, value as int);
        break;
      case bool:
        await sharedPreferences.setBool(key, value as bool);
        break;
      case double:
        await sharedPreferences.setDouble(key, value as double);
        break;
      default:
        throw Exception('Type not suported');
  }
  }
}