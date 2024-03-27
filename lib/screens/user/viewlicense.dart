import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowLisence extends StatefulWidget {
  const ShowLisence({super.key});

  @override
  State<ShowLisence> createState() => _ShowLisenceState();
}

class _ShowLisenceState extends State<ShowLisence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0),
                  border: Border.all(color: Colors.red.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name:'),
                              Text('License No:'),
                              Text('Authorization To Drive:'),
                              Text('Date of Issue:'),
                              Text('DOB:'),
                              Text('S/D/W:'),
                              Text('Blood Group:'),
                              Text('Date of Expiry:'),
                              Text('Perment Address:'),
                              Text('Pesent Adress:'),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name:'),
                            Text('License No:'),
                            Text('Authorization To Drive:'),
                            Text('Date of Issue:'),
                            Text('DOB:'),
                            Text('S/D/W:'),
                            Text('Blood Group:'),
                            Text('Date of Expiry:'),
                            Text('Perment Address:'),
                            Text('Pesent Adress:'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 7, 7, 7)
                                      .withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                        Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 7, 7, 7)
                                      .withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(7)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
