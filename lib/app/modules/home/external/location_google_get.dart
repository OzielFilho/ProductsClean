import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/home/infrastructure/datasources/location_datasource.dart';
import 'package:agence_teste/app/modules/home/infrastructure/models/location_find_model.dart';
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

class LocationGoogle implements LocationDatasource {
  @override
  Future<LocationFind> getLocation() async {
    late bool _serviceEnabled;
    PermissionStatus? _permissionGranted;
    Location location = Location();
    LocationData? _locationData;
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
      }
      _locationData = await location.getLocation();
    } catch (_) {
      Left(Failure(message: 'Error in get location service GOOGLE'));
    }
    return LocationFind(_locationData!.latitude!, _locationData.longitude!);
  }
}
