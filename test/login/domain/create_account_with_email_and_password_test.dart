import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/create_account_with_email_and_password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryImpl extends Mock implements AuthRepository {}

main() {
  AuthRepository? repository;
  CreateAccountWithEmailAndPasswordImpl? usecase;

  setUp(() {
    repository = AuthRepositoryImpl();
    usecase = CreateAccountWithEmailAndPasswordImpl(repository!);
  });

  // test('Should return a AuthResult when create account email and password',
  //     () async {
  //   when(() => repository!.createAccountWithEmailAndPassword(any(), any()))
  //       .thenAnswer((_) async => const Right(void));

  //   final result =
  //       await usecase!(faker.internet.email(), faker.internet.password());

  //   expect(right(result), isA<void>());
  // });

  test(
      'Should return a Failure ParamsEmpty if create email or password has empty',
      () async {
    when(() => repository!.createAccountWithEmailAndPassword(any(), any()))
        .thenThrow((_) async => Left(ParamsEmpty()));

    final result = await usecase!('', '');

    expect(result.fold((l) => l, (r) => null), isA<ParamsEmpty>());
  });
}
