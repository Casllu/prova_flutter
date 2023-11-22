import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova_flutter/app/repositories/login/login_repository_impl.dart';

class ClientMock extends Mock implements Client {
  @override
  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    return Response(jsonReturn, 200);
  }
}

main() {
  final client = ClientMock();

  final repository = LoginRepositoryImpl(client);

  test('deve pegar uma referencia de userModel', () async {
    when(() async {
      await client
          .get(Uri.parse(
              'https://655d30439f1e1093c59918b7.mockapi.io/prova/user'))
          .then((_) => Response(jsonReturn, 200));
    });

    final list = await repository.login();

    expect(list.isNotEmpty, equals(true));
    expect(list.first.login, equals('login1'));
  });
}

const jsonReturn = '''
  [
    {
      "id": "1",
      "login": "login1",
      "password": "12345"
    }
  ]
''';
