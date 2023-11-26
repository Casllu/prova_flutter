import 'package:mobx/mobx.dart';

import '../models/text_model.dart';
import '../repositories/home/home_repository_impl.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeRepositoryImpl? _homeRepository;

  HomeControllerBase() {
    _homeRepository = HomeRepositoryImpl();
  }

  @observable
  var listTexts = <TextModel>[];

  @observable
  var listKeys = <String>[];

  @action
  Future<void> readAllKeys() async {
    final listKeysRead = await _homeRepository!.readAllKeys('ListKeys');

    if (listKeysRead != null) {
      listKeys = [...listKeysRead];
    }
  }

  @action
  Future<void> readAllTexts() async {
    final listTextsRead = <TextModel>[];
    if (listKeys.isNotEmpty) {
      for (String key in listKeys) {
        final textRead = await _homeRepository!.read(key);

        listTextsRead.add(TextModel(key: key, text: textRead!));
      }
      listTexts = [...listTextsRead];
    }
  }

  @action
  Future<void> write(TextModel textModel) async {
    await _homeRepository!.write(textModel.key, textModel.text);
    listKeys.add(textModel.key);
    await _homeRepository!.write('ListKeys', listKeys);
  }

  @action
  Future<void> edit(TextModel textModel, TextModel textModelEditado) async {
    listTexts.remove(textModel);
    await _homeRepository!.remove(textModel.key);
    await _homeRepository!.write(textModelEditado.key, textModelEditado.text);
  }

  @action
  Future<void> remove(TextModel textModel) async {
    await _homeRepository!.remove(textModel.key);
    listTexts.remove(textModel);
    listKeys.remove(textModel.key);
    await _homeRepository!.write('ListKeys', listKeys);
  }
}
