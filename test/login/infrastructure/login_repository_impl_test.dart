import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/infrastructure/datasources/login_datasource.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/login_result_model.dart';
import 'package:agence_teste/app/modules/login/infrastructure/repositories/login_repository.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginDataSourceImpl extends Mock implements LoginDatasource {}

main() {
  LoginDatasource? datasource;
  LoginRepositoryImpl? repository;
  LoginResult? resultLogin;

  setUp(() {
    datasource = LoginDataSourceImpl();
    repository = LoginRepositoryImpl(datasource!);
    resultLogin = LoginResult(faker.internet.userName(), faker.guid.guid());
  });

  test('Should return a LoginResult', () async {
    when(() => datasource!.login()).thenAnswer((_) async => resultLogin!);

    final response = await repository!.auth();

    expect(response.fold((l) => null, (r) => r), isA<LoginResult>());
  });

  test('Should return a Failure LoginError', () async {
    when(() => datasource!.login()).thenThrow((_) async => LoginError());

    final response = await repository!.auth();

    expect(response.fold((l) => l, (r) => null), isA<LoginError>());
  });
}
