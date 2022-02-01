import 'package:agence_teste/app/modules/home/domain/entities/location_result.dart';
import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/home/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/home/domain/repositories/location_repository.dart';
import 'package:agence_teste/app/modules/home/infrastructure/datasources/location_datasource.dart';
import 'package:dartz/dartz.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDatasource datasource;

  LocationRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, LocationResult>> location() async {
    try {
      final response = await datasource.getLocation();
      return Right(response);
    } catch (e) {
      return Left(GetLocationError(message: 'Erro in get location'));
    }
  }
}
