import 'package:agence_teste/app/modules/home/domain/entities/location_result.dart';
import 'package:agence_teste/app/modules/home/domain/repositories/location_repository.dart';
import 'package:agence_teste/app/modules/home/domain/usecases/get_location.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocationRepositoryImpl extends Mock implements LocationRepository {}

main() {
  LocationRepository? repository;
  GetLocationImpl? usecase;
  LocationResult? resultProduct;

  setUp(() {
    repository = LocationRepositoryImpl();
    usecase = GetLocationImpl(repository!);
    resultProduct = LocationResult(0, 0);
  });

  test('Should return an LocationResult if success', () async {
    when(() => repository!.location())
        .thenAnswer((invocation) async => Right(resultProduct!));

    final result = await usecase!();

    expect(result.fold((l) => null, (r) => r), isA<LocationResult>());
  });
}
