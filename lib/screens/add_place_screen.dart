import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places_app/colors.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
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

    final _titleController = TextEditingController();
    File _pickedImage;

    void _selectImage(File pickedImage) {
      _pickedImage = pickedImage;
    }

    void _savePlace() {
      if(_titleController.text.isEmpty || _pickedImage == null) {
        return;
      }
      print(_titleController.text);
      Provider.of<GreatPlaces>(context,listen: false).addPlace(_titleController.text, _pickedImage);
      Navigator.of(context).pop();
    }

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
              ]),
            ),
          )),
          RaisedButton.icon(
              onPressed: _savePlace ,
              icon: Icon(Icons.add),
              label: Text('Add Place'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,


          ),

        ],
      ),
    );
  }
}
