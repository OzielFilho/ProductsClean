import 'package:agence_teste/app/modules/home/presenter/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late GoogleMapController mapController;

  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    var marker = Marker(
      markerId: const MarkerId('User Location'),
      position: LatLng(Modular.get<HomeController>().locationFind!.lat,
          Modular.get<HomeController>().locationFind!.long),
    );

    setState(() {
      _markers[const MarkerId('place_name')] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.hybrid,
          onMapCreated: _onMapCreated,
          markers: _markers.values.toSet(),
          initialCameraPosition: CameraPosition(
            target: LatLng(Modular.get<HomeController>().locationFind!.lat,
                Modular.get<HomeController>().locationFind!.long),
            zoom: 20.0,
          ),
        ));
  }
}
