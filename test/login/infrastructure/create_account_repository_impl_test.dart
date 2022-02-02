import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/infrastructure/datasources/create_account_datasource.dart';
import 'package:agence_teste/app/modules/login/infrastructure/repositories/create_account_repository_impl.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CreateAccountDataSourceImpl extends Mock
    implements CreateAccountDatasource {}

main() {
  CreateAccountDatasource? datasource;
  CreateAccountRepositoryImpl? repository;

  setUp(() {
    datasource = CreateAccountDataSourceImpl();
    repository = CreateAccountRepositoryImpl(datasource!);
  });
  test('Should return a Failure CreateAccountError', () async {
    when(() => datasource!.createAccountWithEmailAndPassword(any(), any()))
        .thenThrow((_) async => CreateAccountError());

    final response = await repository!.createAccountWithEmailAndPassword(
        faker.internet.email(), faker.internet.password());

    expect(response.fold((l) => l, (r) => null), isA<CreateAccountError>());
  });
}
