import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/auth_user.dart';
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryImpl extends Mock implements AuthRepository {}

main() {
  AuthRepository? repository;
  AuthUserImpl? usecase;
  AuthResult? resultAuth;

  setUp(() {
    repository = AuthRepositoryImpl();
    usecase = AuthUserImpl(repository!);
    resultAuth = AuthResult(faker.internet.userName(), faker.guid.guid());
  });

  test('Should return a AuthResult', () async {
    when(() => repository!.auth()).thenAnswer((_) async => Right(resultAuth!));

    final result = await usecase!();

    expect(result.fold((l) => null, (r) => r), isA<AuthResult>());
  });
}
