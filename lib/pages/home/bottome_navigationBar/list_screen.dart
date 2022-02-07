import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  XFile? _image;
  Future _pickImageFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  //imagefromgallary
  Future _pickImageFromGallery() async {
    XFile? image1 = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image1;
    });
  }

  //show mode bottom sheet

  void _showModel(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: Wrap(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    _pickImageFromCamera();

                    Navigator.pop(context);
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.camera,
                    ),
                    title: Text('image from camera'),
                  )),
              ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery();
                    Navigator.pop(context);
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.camera,
                    ),
                    title: Text('image from Gallery'),
                  )),
            ],
          ));
        });
  }

  static const List<String> _kOptions = <String>['kartik', 'icons', 'flitter'];
  //shared prefrences

  // getholdiamge() async {
  //   SharedPreferences holdImage = await SharedPreferences.getInstance();
  //   holdImage.get('profImage');
  // }

  // setHoldImage() async {
  //   SharedPreferences showHoldImage = await SharedPreferences.getInstance();
  //   showHoldImage.se
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () => _showModel(context),
              child: CircleAvatar(
                radius: 50,
                child: _image != null
                    ? ClipOval(
                        child: Image.file(
                          File(_image!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        child: const Icon(
                          Icons.camera_alt,
                          size: 50,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Autocomplete<String>(optionsBuilder: (TextEditingValue textval) {
            if (textval.text == '') {
              return const Iterable<String>.empty();
            }
            return _kOptions.where((String option) {
              return option.contains(textval.text.toLowerCase());
            });
          }),
          TextField(
            decoration: InputDecoration(hintText: 'Email'),
            autofillHints: [AutofillHints.email],
          )
        ],
      ),
    );
  }
}
