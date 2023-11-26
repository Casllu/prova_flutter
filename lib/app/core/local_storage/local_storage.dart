abstract interface class LocalStorage {
  Future<String?> read(String key);
  Future<List<String>?> readAll(String key);
  Future<void> write<V>(String key, V value);
  Future<bool> contains(String key);
  Future<void> remove(String key);
}