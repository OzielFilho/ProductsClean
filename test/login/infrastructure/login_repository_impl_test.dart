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
  LoginResults? resultLogin;

  setUp(() {
    datasource = LoginDataSourceImpl();
    repository = LoginRepositoryImpl(datasource!);
    resultLogin = LoginResults(faker.internet.userName(), faker.guid.guid());
  });

  test('Should return a LoginResult google', () async {
    when(() => datasource!.loginWithGoogle())
        .thenAnswer((_) async => resultLogin!);

    final response = await repository!.loginWithGoogle();

    expect(response.fold((l) => null, (r) => r), isA<LoginResults>());
  });

  test('Should return a LoginResult facebook', () async {
    when(() => datasource!.loginWithFacebook())
        .thenAnswer((_) async => resultLogin!);

    final response = await repository!.loginWithFacebook();

    expect(response.fold((l) => null, (r) => r), isA<LoginResults>());
  });

  test('Should return a LoginResult email and password', () async {
    when(() => datasource!.loginWithEmailAndPassword(any(), any()))
        .thenAnswer((_) async => resultLogin!);

    final response = await repository!.loginWithEmailAndPassword(
        faker.internet.email(), faker.internet.password());

    expect(response.fold((l) => null, (r) => r), isA<LoginResults>());
  });

  test('Should return a Failure LoginError', () async {
    when(() => datasource!.loginWithGoogle())
        .thenThrow((_) async => LoginError());

    final response = await repository!.loginWithGoogle();

    expect(response.fold((l) => l, (r) => null), isA<LoginError>());
  });

  test('Should return a Failure CreateAccountError', () async {
    when(() => datasource!.createAccountWithEmailAndPassword(any(), any()))
        .thenThrow((_) async => CreateAccountError());

    final response = await repository!.createAccountWithEmailAndPassword(
        faker.internet.email(), faker.internet.password());

    expect(response.fold((l) => l, (r) => null), isA<CreateAccountError>());
  });
}
