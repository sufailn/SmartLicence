import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchlicense extends StatelessWidget {
  const searchlicense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Smart ",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "License.",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    border: Border.all(color: Colors.red.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(7)),
                width: 200,
                child: CupertinoSearchTextField(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Search License"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    border: Border.all(color: Colors.red.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(7)),
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
