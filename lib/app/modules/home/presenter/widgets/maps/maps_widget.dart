import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late GoogleMapController mapController;
  Location location = Location();
  late bool _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  LatLng? _center;
  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    var marker = Marker(
      markerId: const MarkerId('User Location'),
      position: _center!,
    );

    setState(() {
      _markers[const MarkerId('place_name')] = marker;
    });
  }

  void _getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    setState(() {
      _center = LatLng(_locationData!.latitude!, _locationData!.longitude!);
    });
  }

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _center != null
        ? SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: _markers.values.toSet(),
              initialCameraPosition: CameraPosition(
                target: _center!,
                zoom: 20.0,
              ),
            ))
        : Container();
  }
}
