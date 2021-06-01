import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places_app/colors.dart';
import 'package:great_places_app/models/place.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/widgets/image_input.dart';
import 'package:great_places_app/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  final _titleController = TextEditingController();
  File _pickedImage;
  PlaceLocation _pickedLocation;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = PlaceLocation(latitude: lat,longitude: lng);
  }

  void _savePlace() {
    if(_titleController.text.isEmpty || _pickedImage == null || _pickedLocation == null) {
      return;
    }
    print(_titleController.text);
    Provider.of<GreatPlaces>(context,listen: false).addPlace(_titleController.text, _pickedImage,_pickedLocation);
    Navigator.of(context).pop();
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Add A New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column( children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration:InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: kPrimaryColor)),
                    ),
                  ),
                SizedBox(height: 10,),
                ImageInput(_selectImage),
                SizedBox(height: 10,),
                LocationInput(_selectPlace)
              ]),
            ),
          )),
          TextButton.icon(
              onPressed: _savePlace ,
              icon: Icon(Icons.add),
              label: Text('Add Place'),
                   ),

        ],
      ),
    );
  }
}
