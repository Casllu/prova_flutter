import 'dart:convert';

import 'package:http/http.dart';
import 'package:prova_flutter/app/models/user_model.dart';
import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  late Client client;

  LoginRepositoryImpl([Client? client]) {
    this.client = (client == null)
      ? Client()
      : client;
  }

  @override
  Future<List<UserModel>> login() async {
    final response = await client.get(
        Uri.parse('https://655d30439f1e1093c59918b7.mockapi.io/prova/user'));

    if (response.statusCode != 200) {
    throw Exception('Erro no servidor');
  } else {
    final jsonList = jsonDecode(response.body) as List;

    return jsonList.map((e) => UserModel.fromMap(e)).toList();
  }
  }
}
