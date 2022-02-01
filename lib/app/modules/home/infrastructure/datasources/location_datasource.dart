import 'package:agence_teste/app/modules/home/infrastructure/models/location_find_model.dart';

abstract class LocationDatasource {
  Future<LocationFind> getLocation();
}
