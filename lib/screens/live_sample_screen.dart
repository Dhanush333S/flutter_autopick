import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:auto_pick/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class LiveSampleScreen extends StatefulWidget {
  // final Uint8List image;
  const LiveSampleScreen({super.key});

  @override
  State<LiveSampleScreen> createState() => _LiveSampleScreenState();
}

class _LiveSampleScreenState extends State<LiveSampleScreen> {
  final picker = ImagePicker();
  File? imageFile;

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
      });
      // reload();
    }
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.pop(context);
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: SizedBox(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 60.0,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.pop(context);
                      },
                    ))
                  ],
                )),
          );
        });
  }

  void sendImgSever(File? image, BuildContext context) async {
    try {
      if (image != null) {
        final request =
            http.MultipartRequest("POST", Uri.parse("http://10.0.2.2:5000/upload"));
        final headers = {"Content-type": "multipart/form-data"};
        request.files.add(http.MultipartFile(
            'image', image.readAsBytes().asStream(), image.lengthSync(),
            filename: image.path.split("/").last));
        request.headers.addAll(headers);
        final response=await request.send();
        http.Response res=await http.Response.fromStream(response);
        final resJson=jsonDecode(res.body);
        print(resJson);
      } else {
        showSnackBar("Image not selected", context);
      }
    } catch (e) {
        print(e.toString());
      showSnackBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(48),
                // Image radius
                child: Image(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1686297053585-f62dc5e887df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Image(
              image: AssetImage('assets/symbol.png'),
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(30),
                child: Image.asset(
                  'assets/paramount.jpg',
                  fit: BoxFit.contain,
                  height: 10.0,
                  width: 50.0,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            imageFile == null
                ? Image.asset(
                    'assets/paramount.jpg',
                    height: 300.0,
                    width: 300.0,
                  )
                : ClipRRect(
                    child: Image.file(
                    imageFile!,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.fill,
                  )),
            const SizedBox(
              height: 20.0,
            ),
            imageFile == null
                ? ElevatedButton(
                    onPressed: () async {
                      showImagePicker(context);
                    },
                    child: const Text('Take Image'),
                  )
                : ElevatedButton(
                    onPressed:()=> sendImgSever(imageFile,context), child: const Text("Process")),
          ],
        ),
      ),
    );
  }
}
