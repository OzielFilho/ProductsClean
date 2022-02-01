import 'package:agence_teste/app/modules/home/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/home/infrastructure/datasources/location_datasource.dart';
import 'package:agence_teste/app/modules/home/infrastructure/models/location_find_model.dart';
import 'package:agence_teste/app/modules/home/infrastructure/repositories/location_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocationDatasourceImpl extends Mock implements LocationDatasource {}

main() {
  LocationDatasourceImpl? datasource;
  LocationRepositoryImpl? repository;
  LocationFind? resultLocation;

  setUp(() {
    datasource = LocationDatasourceImpl();
    repository = LocationRepositoryImpl(datasource!);
    resultLocation = LocationFind(0, 0);
  });

  test('Should return an LocationFind if sucess in get location', () async {
    when(() => datasource!.getLocation())
        .thenAnswer((_) async => resultLocation!);

    final response = await repository!.location();

    expect(response.fold((l) => null, (r) => r), isA<LocationFind>());
  });

  test('Should return an GetLocationError if get location return error',
      () async {
    when(() => datasource!.getLocation())
        .thenThrow((_) async => GetLocationError());

    final response = await repository!.location();

    expect(response.fold((l) => l, (r) => null), isA<GetLocationError>());
  });
}
