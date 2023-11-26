abstract class HomeRepository {
  Future<String?> read(String key);
  Future<List<String>?> readAllKeys(String key);
  Future<bool> contains(String key);
  Future<void> remove(String key);
  Future<void> write<T>(String key, T value);
}
