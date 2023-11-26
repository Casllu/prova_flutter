import '../../core/local_storage/shered_preferences/shared_preferences_local_storage_impl.dart';
import './home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
    late SharedPreferencesLocalStorageImpl localStorage;

  HomeRepositoryImpl([SharedPreferencesLocalStorageImpl? localStorage]) {
    this.localStorage = (localStorage == null) ? SharedPreferencesLocalStorageImpl() : localStorage;
  }


  @override
  Future<String?> read(String key) async {
    final text = await localStorage.read(key);

    return text;
  }

  @override
  Future<List<String>?> readAllKeys(String key) async {
    final listTexts = await localStorage.readAll(key);

    return listTexts;
  }

   @override
  Future<bool> contains(String key) async {
    return localStorage.contains(key);
  }

  @override
  Future<void> remove(String key) async{
   await localStorage.remove(key);
  }

  @override
  Future<void> write<T>(String key, T value) async {
    await localStorage.write(key, value);
  }

}
