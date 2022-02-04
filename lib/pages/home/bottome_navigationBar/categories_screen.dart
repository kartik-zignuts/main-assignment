import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final LatLng _initialcameraposition = const LatLng(20.5937, 78.9629);
  GoogleMapController? _controller;
  final Location _location = Location();

  void _onMapCreated(GoogleMapController _gmcontroller) {
    _controller = _gmcontroller;
    _location.onLocationChanged.listen((event) {
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(event.latitude!, event.longitude!), zoom: 15)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _initialcameraposition),
        mapType: MapType.normal,
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
