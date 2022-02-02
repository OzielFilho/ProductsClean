import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/create_account_repository.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/create_account_with_email_and_password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CreateAccountRepositoryImpl extends Mock
    implements CreateAccountRepository {}

main() {
  CreateAccountRepository? repository;
  CreateAccountWithEmailAndPasswordImpl? usecase;

  setUp(() {
    repository = CreateAccountRepositoryImpl();
    usecase = CreateAccountWithEmailAndPasswordImpl(repository!);
  });

  test(
      'Should return a Failure ParamsEmpty if create email or password has empty',
      () async {
    when(() => repository!.createAccountWithEmailAndPassword(any(), any()))
        .thenThrow((_) async => Left(ParamsEmpty()));

    final result = await usecase!('', '');

    expect(result.fold((l) => l, (r) => null), isA<ParamsEmpty>());
  });
}
