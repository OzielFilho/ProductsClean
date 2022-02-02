import '../../domain/entities/location_result.dart';
import '../../../../core/errors/errors.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasources/location_datasource.dart';
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
