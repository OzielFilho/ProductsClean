import 'package:agence_teste/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryImpl extends Mock implements AuthRepository {}

main() {
  AuthRepository? repository;
  GetLoggedUserImpl? usecase;
  LoggedUserInfo? resultInfo;

  setUp(() {
    repository = AuthRepositoryImpl();
    usecase = GetLoggedUserImpl(repository!);
    resultInfo = LoggedUserInfo(faker.internet.userName(),
        faker.internet.email(), faker.phoneNumber.us(), faker.image.image());
  });

  test('Should return a LoggedUserInfo with get loggedUser', () async {
    when(() => repository!.loggedUser())
        .thenAnswer((_) async => Right(resultInfo!));

    final result = await usecase!();

    expect(result.fold((l) => null, (r) => r), isA<LoggedUserInfo>());
  });
}
