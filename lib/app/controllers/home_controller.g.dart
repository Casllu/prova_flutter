// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$listTextsAtom =
      Atom(name: 'HomeControllerBase.listTexts', context: context);

  @override
  List<TextModel> get listTexts {
    _$listTextsAtom.reportRead();
    return super.listTexts;
  }

  @override
  set listTexts(List<TextModel> value) {
    _$listTextsAtom.reportWrite(value, super.listTexts, () {
      super.listTexts = value;
    });
  }

  late final _$listKeysAtom =
      Atom(name: 'HomeControllerBase.listKeys', context: context);

  @override
  List<String> get listKeys {
    _$listKeysAtom.reportRead();
    return super.listKeys;
  }

  @override
  set listKeys(List<String> value) {
    _$listKeysAtom.reportWrite(value, super.listKeys, () {
      super.listKeys = value;
    });
  }

  late final _$readAllKeysAsyncAction =
      AsyncAction('HomeControllerBase.readAllKeys', context: context);

  @override
  Future<void> readAllKeys() {
    return _$readAllKeysAsyncAction.run(() => super.readAllKeys());
  }

  late final _$readAllTextsAsyncAction =
      AsyncAction('HomeControllerBase.readAllTexts', context: context);

  @override
  Future<void> readAllTexts() {
    return _$readAllTextsAsyncAction.run(() => super.readAllTexts());
  }

  late final _$writeAsyncAction =
      AsyncAction('HomeControllerBase.write', context: context);

  @override
  Future<void> write(TextModel textModel) {
    return _$writeAsyncAction.run(() => super.write(textModel));
  }

  late final _$editAsyncAction =
      AsyncAction('HomeControllerBase.edit', context: context);

  @override
  Future<void> edit(TextModel textModel, TextModel textModelEditado) {
    return _$editAsyncAction.run(() => super.edit(textModel, textModelEditado));
  }

  late final _$removeAsyncAction =
      AsyncAction('HomeControllerBase.remove', context: context);

  @override
  Future<void> remove(TextModel textModel) {
    return _$removeAsyncAction.run(() => super.remove(textModel));
  }

  @override
  String toString() {
    return '''
listTexts: ${listTexts},
listKeys: ${listKeys}
    ''';
  }
}
