import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_email_and_password.dart';
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryImpl extends Mock implements AuthRepository {}

main() {
  AuthRepository? repository;
  LoginWithEmailAndPasswordImpl? usecase;
  AuthResult? resultAuth;

  setUp(() {
    repository = AuthRepositoryImpl();
    usecase = LoginWithEmailAndPasswordImpl(repository!);
    resultAuth = AuthResult(faker.internet.userName(), faker.guid.guid());
  });

  test('Should return a AuthResult with email', () async {
    when(() => repository!.loginWithEmailAndPassword(any(), any()))
        .thenAnswer((_) async => Right(resultAuth!));

    final result =
        await usecase!(faker.internet.email(), faker.internet.password());

    expect(result.fold((l) => null, (r) => r), isA<AuthResult>());
  });

  test('Should return a Failure ParamsEmpty if email or password has empty',
      () async {
    when(() => repository!.loginWithEmailAndPassword(any(), any()))
        .thenThrow((_) async => Left(ParamsEmpty()));

    final result = await usecase!('', '');

    expect(result.fold((l) => l, (r) => null), isA<ParamsEmpty>());
  });
}
