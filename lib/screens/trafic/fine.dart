import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_license/customwidget/textfield.dart';
import 'package:smart_license/utils/api/trafic/semdfineApi.dart';

class Fine extends StatefulWidget {
  Fine({Key? key, this.vnumber}) : super(key: key);
  final vnumber;

  @override
  _FineState createState() => _FineState();
}

class _FineState extends State<Fine> {
  TextEditingController offenceController = TextEditingController();
  TextEditingController fineController = TextEditingController();
  File? _pickedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Smart ",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "License.",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Show selected image
                if (_pickedImage != null) ...[
                  Image.file(_pickedImage!),
                  SizedBox(
                    height: 20,
                  ),
                ],
                customtextfield(
                  label: Text('Offence'),
                  controller: offenceController,
                ),
                SizedBox(
                  height: 5,
                ),
                customtextfield(
                  label: Text('Fine amount'),
                  controller: fineController,
                ),
                SizedBox(
                  height: 20,
                ),
                // Add Image Picker Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: Text('Take Photo'),
                    ),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      child: Text('Pick from Gallery'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Handle sending data
                    Map<String, dynamic> data = {
                      'offence': offenceController.text,
                      'fineamount': fineController.text,
                      'vehiclenumber': widget.vnumber,
                    };
                    await sendFineApi(data, _pickedImage, context);
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
