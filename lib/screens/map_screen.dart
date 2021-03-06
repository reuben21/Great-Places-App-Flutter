import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places_app/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: 37.422, longitude: -122.233),
      this.isSelecting = false});

  @override
  _MapScreenState createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _selectPlace(LatLng Position) {
    setState(() {
      _pickedLocation = Position;
    });
  }

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
    print(widget.initialLocation.latitude);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map', style: Theme.of(context).textTheme.headline1),
        actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialLocation.latitude,
                widget.initialLocation.longitude),
            zoom: 13),
        onTap: widget.isSelecting ? _selectPlace : null,
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                    markerId: MarkerId('m1'),
                    position: _pickedLocation ??
                        LatLng(widget.initialLocation.latitude,
                            widget.initialLocation.longitude))
              },
      ),
    );
  }
}
