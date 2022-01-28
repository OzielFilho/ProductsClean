import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/recovery_password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryImpl extends Mock implements AuthRepository {}

main() {
  AuthRepository? repository;
  RecoveryPasswordImpl? usecase;

  setUp(() {
    repository = AuthRepositoryImpl();
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
