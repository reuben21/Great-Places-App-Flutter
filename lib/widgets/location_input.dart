import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_places_app/colors.dart';
import 'package:great_places_app/helpers/location_helper.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  LocationInput({Key key}) : super(key: key);

  @override
  _LocationInputState createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getCurrentUserLocation() async {
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
    print(_locationData.latitude);
    print(_locationData.longitude);
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: _locationData.latitude, longitude: _locationData.longitude);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: kPrimaryColor)),
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            child: _previewImageUrl == null
                ? Text(
              'No Location Chosen',
              textAlign: TextAlign.center,
            )
                : Image.network(
              _previewImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            )),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                  onPressed: _getCurrentUserLocation,
                  icon: Icon(Icons.location_on),
                  label: Text('Current Location')),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.map),
                  label: Text('Select On Map'))
            ])
      ],
    );
  }
}
