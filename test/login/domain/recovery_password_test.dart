import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/account_helpers_repository.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/recovery_password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AccountHelpersRepositoryImpl extends Mock
    implements AccountHelpersRepository {}

main() {
  AccountHelpersRepository? repository;
  RecoveryPasswordImpl? usecase;

  setUp(() {
    repository = AccountHelpersRepositoryImpl();
    usecase = RecoveryPasswordImpl(repository!);
  });

  test('Should return a Failure ParamsEmpty if in recovery email has empty',
      () async {
    when(() => repository!.recoveryPassword(any()))
        .thenThrow((_) async => Left(ParamsEmpty()));

    final result = await usecase!('');

    expect(result.fold((l) => l, (r) => null), isA<ParamsEmpty>());
  });
}
