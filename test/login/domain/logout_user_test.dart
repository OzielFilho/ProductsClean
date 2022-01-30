import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/logout_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryImpl extends Mock implements AuthRepository {}

main() {
  AuthRepository? repository;
  LogoutUserImpl? usecase;

  setUp(() {
    repository = AuthRepositoryImpl();
    usecase = LogoutUserImpl(repository!);
  });

  test('should verify if exist User Logged', () async {
    when(() => repository!.logout()).thenAnswer((_) async => const Right(unit));
    var result = (await usecase!()).fold((l) => null, (r) => r);
    expect(result, unit);
  });
}
