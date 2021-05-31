import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_places_app/colors.dart';

class LocationInput extends StatefulWidget {
  LocationInput({Key key}) : super(key: key);

  @override
  _LocationInputState createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(border: Border.all(width: 1,color:kPrimaryColor)),
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
              onPressed: () {},
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
