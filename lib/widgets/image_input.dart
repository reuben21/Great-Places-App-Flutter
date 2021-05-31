import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places_app/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;


class ImageInput extends StatefulWidget {
  final Function onSelectImage;


  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile =
        await picker.getImage(source: ImageSource.camera, maxWidth: 600);
    if(imageFile == null) {
      return;
    }

    setState(() {
      _storedImage = File(imageFile.path);
    });


    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await File(imageFile.path).copy('${appDir.path}/${fileName}');
    widget.onSelectImage(savedImage);
    print(savedImage);
  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Row(
      children: <Widget>[
        Container(
          width: 200,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: kPrimaryColor)),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "No Image Taken",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: IconButton(
          icon: Icon(Icons.camera),
          color: Theme.of(context).primaryColor,
          onPressed: _takePicture,
        ))
      ],
    );
  }
}
