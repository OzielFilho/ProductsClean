import '../models/location_find_model.dart';

abstract class LocationDatasource {
  Future<LocationFind> getLocation();
}
