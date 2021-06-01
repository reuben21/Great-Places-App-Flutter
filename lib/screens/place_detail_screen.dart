import 'package:flutter/material.dart';
import 'package:great_places_app/colors.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {

  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(selectedPlace.title,
            style: Theme.of(context).textTheme.headline1),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Address: ${selectedPlace.location.address}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (ctx) => MapScreen(
                          initialLocation: selectedPlace.location,
                          isSelecting: false,
                        )));
              },

              child: Text('View On Map' ,style: Theme.of(context).textTheme.headline3,))
        ],
      ),
    );
  }
}
