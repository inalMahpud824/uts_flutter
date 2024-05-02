import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({super.key});

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  Position? _currentPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentPosition != null) Text(
              "LAT: ${_currentPosition?.latitude}, LNG: ${_currentPosition?.longitude}"
            ),
            ElevatedButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: Text("Get location"),
            )
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        // print(_currentPosition!.latitude);
        // print(_currentPosition!.longitude);
      });
    }).catchError((e) {
      print(e);
    });
  }

  
}
