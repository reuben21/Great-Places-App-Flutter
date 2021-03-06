import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:great_places_app/widgets/PlaceItem.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Your Places', style: Theme.of(context).textTheme.headline1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);

            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context,listen: false).fetchAndSetPlaces(),
        builder:(ctx,snapshot)=>snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),) : Consumer<GreatPlaces>(
          child: Center(
            child: Text('Start Adding the Places your Visiting'),
          ),
          builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
              ? ch
              : GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 6 / 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
                  itemBuilder: (ctx, i) => PlaceItem(greatPlaces.items[i].id, greatPlaces.items[i].title, greatPlaces.items[i].image,greatPlaces.items[i].location),
                  itemCount: greatPlaces.items.length,
                ),
        ),
      ),
    );
  }
}
