import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/infrastructure/datasources/auth_datasource.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/authentication_result_model.dart';
import 'package:agence_teste/app/modules/login/infrastructure/repositories/auth_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthDataSourceImpl extends Mock implements AuthDatasource {}

main() {
  AuthDatasource? datasource;
  AuthRepositoryImpl? repository;
  AuthenticationResult? resultLogin;

  setUp(() {
    datasource = AuthDataSourceImpl();
    repository = AuthRepositoryImpl(datasource!);
    resultLogin =
        AuthenticationResult(faker.internet.userName(), faker.guid.guid());
  });

  test('Should return a LoginResult google', () async {
    when(() => datasource!.loginWithGoogle())
        .thenAnswer((_) async => resultLogin!);

    final response = await repository!.loginWithGoogle();

    expect(response.fold((l) => null, (r) => r), isA<AuthenticationResult>());
  });

  test('Should return a LoginResult facebook', () async {
    when(() => datasource!.loginWithFacebook())
        .thenAnswer((_) async => resultLogin!);

    final response = await repository!.loginWithFacebook();

    expect(response.fold((l) => null, (r) => r), isA<AuthenticationResult>());
  });

  test('Should return a LoginResult email and password', () async {
    when(() => datasource!.loginWithEmailAndPassword(any(), any()))
        .thenAnswer((_) async => resultLogin!);

    final response = await repository!.loginWithEmailAndPassword(
        faker.internet.email(), faker.internet.password());

    expect(response.fold((l) => null, (r) => r), isA<AuthenticationResult>());
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

  test('Should return a Failure RecoveryPasswordError', () async {
    when(() => datasource!.recoveryPassword(
          any(),
        )).thenThrow((_) async => RecoveryPasswordError());

    final response = await repository!.recoveryPassword(
      faker.internet.email(),
    );

    expect(response.fold((l) => l, (r) => null), isA<RecoveryPasswordError>());
  });

  test('Should return a Failure GetUserLogged', () async {
    when(() => datasource!.getUserLogged())
        .thenThrow((_) async => LoggedUserError());

    final response = await repository!.loggedUser();

    expect(response.fold((l) => l, (r) => null), isA<LoggedUserError>());
  });
}
