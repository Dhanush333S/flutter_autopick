import 'dart:typed_data';

import 'package:auto_pick/screens/live_sample_screen.dart';
import 'package:auto_pick/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Uint8List? _image;

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Pick Image'),
            children: [
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: Text('Take Photo'),
                  onPressed: () async {
                    final ImagePicker _imagepicker = ImagePicker();
                    XFile? _file = await _imagepicker.pickImage(
                        source: ImageSource.camera);
                    if (_file != null) {
                      _image = await _file.readAsBytes();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>LiveSampleScreen()));
                    }
                  }),
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: Text('From Gallery'),
                  onPressed: () async {
                    final ImagePicker _imagepicker = ImagePicker();
                    XFile? _file = await _imagepicker.pickImage(
                        source: ImageSource.gallery);
                    if (_file != null) {
                      _image = await _file.readAsBytes();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>LiveSampleScreen()));
                    }
                  }),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Text('Cancel'),
                onPressed: (){
                  showSnackBar('No Image Selected', context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Device : ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'MD DigiPICK',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Text.rich(
                TextSpan(
                  text: 'Connection Status : ',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Poppins',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Connected',
                        style: TextStyle(
                          color: Colors.green.shade200,
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 60.0),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade400,
                      minimumSize: const Size.fromHeight(80)),
                  child: Row(
                    children: [
                      Text(
                        'About',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 40.0),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>LiveSampleScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade400,
                      minimumSize: const Size.fromHeight(80)),
                  child: Row(
                    children: [
                      Text(
                        'Live Sample',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 40.0),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade400,
                      minimumSize: const Size.fromHeight(80)),
                  child: Row(
                    children: [
                      Text(
                        'Saved Report',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 40.0),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade400,
                      minimumSize: const Size.fromHeight(80)),
                  child: Row(
                    children: [
                      Text(
                        'Print Report',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
