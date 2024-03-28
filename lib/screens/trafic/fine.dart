import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:smart_license/customwidget/textfield.dart';

class Fine extends StatefulWidget {
  Fine({Key? key}) : super(key: key);

  @override
  _FineState createState() => _FineState();
}

class _FineState extends State<Fine> {
  TextEditingController offenceController = TextEditingController();
  TextEditingController fineController = TextEditingController();
  File? _pickedImage;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _pickedImage = File(result.files.single.path!);
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
                    // Text(
                    //   "License.",
                    //   style: TextStyle(
                    //     color: Colors.red,
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
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
                SizedBox(
                  height: 20,
                ),
                // Add Image Picker Button
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick Image'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle sending data
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
