import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';

class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  MapScreen({Key key, @required this.latitude, @required this.longitude})
      : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;

  Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context) {
    markers.addAll([
      Marker(
          markerId: MarkerId('position'),
          position: LatLng(widget.latitude, widget.longitude))
    ]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'OVERWATCH',
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(widget.latitude, widget.longitude),
                    zoom: 18.0),
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.hybrid,
                markers: markers,
                zoomControlsEnabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
