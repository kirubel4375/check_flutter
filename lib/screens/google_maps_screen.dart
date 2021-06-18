import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:check_flutter/modules/geolocator.dart';


class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key key}) : super(key: key);

  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}
class _GoogleMapsScreenState extends State<GoogleMapsScreen> {

  Set<Marker> _markers={};

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId("id-1"), position: location.locationPosition)
      );
    });
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: location.locationPosition,
            zoom: 19,
          ),
        ),
      ),
    );
  }
}


