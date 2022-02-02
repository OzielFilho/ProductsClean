import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/infrastructure/datasources/account_helpers_datasource.dart';
import 'package:agence_teste/app/modules/login/infrastructure/repositories/account_helpers_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AccountHelpersDataSourceImpl extends Mock
    implements AccountHelpersDataSource {}

main() {
  AccountHelpersDataSource? datasource;
  AccountHelpersRepositoryImpl? repository;

  setUp(() {
    datasource = AccountHelpersDataSourceImpl();
    repository = AccountHelpersRepositoryImpl(datasource!);
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

  test('Should return a Failure logout', () async {
    when(() => datasource!.logout()).thenThrow((_) async => LogoutError());

    final response = await repository!.logout();

    expect(response.fold((l) => l, (r) => null), isA<LogoutError>());
  });
}
