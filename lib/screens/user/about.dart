import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25),
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
                    )),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Text(
                  'About SmarLicense',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'At SmarLicense, we\'re pioneering the future of digital identification and licensing solutions. Our mission is to simplify and enhance the way individuals and organizations manage licenses, certifications, and credentials.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Who We Are',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'SmarLicense is a team of passionate innovators, engineers, and designers dedicated to revolutionizing the licensing landscape. We combine cutting-edge technology with a deep understanding of user needs to create intuitive, secure, and scalable solutions.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'What We Do',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'We provide a comprehensive platform for managing licenses and certifications across industries. Our robust system streamlines the process of issuing, renewing, and verifying licenses, saving time and resources for both individuals and organizations.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
