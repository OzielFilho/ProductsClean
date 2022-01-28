import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryImpl extends Mock implements AuthRepository {}

main() {
  AuthRepository? repository;
  LoginWithGoogleImpl? usecase;
  AuthResult? resultAuth;

  setUp(() {
    repository = AuthRepositoryImpl();
    usecase = LoginWithGoogleImpl(repository!);
    resultAuth = AuthResult(faker.internet.userName(), faker.guid.guid());
  });

  test('Should return a AuthResult with google', () async {
    when(() => repository!.loginWithGoogle())
        .thenAnswer((_) async => Right(resultAuth!));

    final result = await usecase!();

    expect(result.fold((l) => null, (r) => r), isA<AuthResult>());
  });
}
