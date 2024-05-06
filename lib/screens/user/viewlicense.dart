import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/utils/api/loginApi.dart';

class ShowLisence extends StatefulWidget {
  const ShowLisence({super.key, this.liseccsdata});
  final liseccsdata;
  @override
  State<ShowLisence> createState() => _ShowLisenceState();
}

class _ShowLisenceState extends State<ShowLisence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45, spreadRadius: 3, blurRadius: 4)
                  ],
                  color: Color.fromARGB(255, 225, 248, 233),
                  border: Border.all(color: Colors.red.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
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
                              Text('Present Adress:'),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.liseccsdata[0]['Name']),
                            Text(
                                widget.liseccsdata[0]['Licence_No'].toString()),
                            Text(widget.liseccsdata[0]['Authorization_To_Drive']
                                .toString()),
                            Text(widget.liseccsdata[0]['Date_of_Issue']
                                .toString()
                                .substring(0, 16)),
                            Text(widget.liseccsdata[0]['DOB']
                                .toString()
                                .substring(0, 16)),
                            Text(widget.liseccsdata[0]['relation']),
                            Text(widget.liseccsdata[0]['Blood_Group']
                                .toString()),
                            Text(widget.liseccsdata[0]['validity']
                                .toString()
                                .substring(0, 16)),
                            Text(widget.liseccsdata[0]['Permanent_Address']),
                            Text(widget.liseccsdata[0]['Present_Address']),
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
                          child: Image.network(
                            '$baseUrl/static/images/${widget.liseccsdata[0]['photo']}',
                            fit: BoxFit.fill,
                          ),
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
                          child: Image.network(
                            '$baseUrl/static/QR/${widget.liseccsdata[0]['qr']}',
                            fit: BoxFit.fill,
                          ),
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
