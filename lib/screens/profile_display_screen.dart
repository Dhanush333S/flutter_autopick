import 'dart:typed_data';

import 'package:auto_pick/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDisplayScreen extends StatefulWidget {
  const ProfileDisplayScreen({super.key});

  @override
  State<ProfileDisplayScreen> createState() => _ProfileDisplayScreenState();
}

class _ProfileDisplayScreenState extends State<ProfileDisplayScreen> {

  Uint8List? _image;

  @override
  Widget build(BuildContext context) {

    
    void selectImage()async{
    final ImagePicker _imagepicker=ImagePicker();
    XFile? _file= await _imagepicker.pickImage(source: ImageSource.gallery);
    if(_file != null){
      _image=await _file.readAsBytes();
      setState(() {
        showSnackBar("Profile Image Changed", context);
      });
    }
  }
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'User ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Complete your profile details',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Poppins',
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.0,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(50),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image:_image==null?
                                      DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1686297053585-f62dc5e887df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80'),
                                      fit: BoxFit.cover
                                      )
                                      :
                                       DecorationImage(
                                        image:MemoryImage(
                                          _image!
                                        ),
                                        fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Karan Singh',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'User ID : 119862',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  TextButton(
                                    onPressed: selectImage,
                                    child: Text(
                                      'Edit Photo',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Divider(
                            // Creates the lines between the widgets.
                            thickness: 2.0,
                            height: 20.0,
                            color: Colors.grey[50],
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Karan Singh',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            // Creates the lines between the widgets.
                            thickness: 1.0,
                            height: 20.0,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'Company',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Tex Experts',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            // Creates the lines between the widgets.
                            thickness: 1.0,
                            height: 20.0,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'Designation',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'QC Manager',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            // Creates the lines between the widgets.
                            thickness: 1.0,
                            height: 20.0,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'State',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Tamil Nadu',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            // Creates the lines between the widgets.
                            thickness: 1.0,
                            height: 20.0,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'Country',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'India',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent[700],
                                  elevation: 20,
                                  minimumSize: Size(30, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                              onPressed: () {},
                              child: Text(
                                'Save Profile',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
