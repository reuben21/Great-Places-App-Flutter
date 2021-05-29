import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places',style:  Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
