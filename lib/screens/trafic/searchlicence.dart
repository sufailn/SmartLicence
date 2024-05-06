import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/main.dart';
import 'package:smart_license/screens/trafic/traffichome.dart';
import 'package:smart_license/screens/user/home.dart';
import 'package:smart_license/utils/api/getLisenceApi.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

class searchlicense extends StatefulWidget {
  searchlicense({super.key});

  @override
  State<searchlicense> createState() => _searchlicenseState();
}

class _searchlicenseState extends State<searchlicense> {
  TextEditingController searchcontroll = TextEditingController();

  List<Map<String, dynamic>> lisenceData = [];

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
                TextButton(
                  onPressed: () {
                    navigationreplace(context, TrafficHomeScreen());
                  },
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
                        "Licence.",
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
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    border: Border.all(color: Colors.red.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(7)),
                width: 250,
                child: CupertinoSearchTextField(
                  placeholder: 'Enter License No',
                  controller: searchcontroll,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                lisenceData = await getLisenceTrafic(searchcontroll.text);
                setState(() {});
              },
              child: Text("Search Licence"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.red),
            ),
            if (lisenceData.length != 0)
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            spreadRadius: 3,
                            blurRadius: 5)
                      ],
                      color: Color.fromARGB(255, 213, 233, 227),
                      border: Border.all(color: Colors.red.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 210,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name:'),
                                  Text('License No:'),
                                  Text('Authorization To Drive:'),
                                  Text('Date of Issue:'),
                                  Text('DOB:'),
                                  Text('Relation:'),
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
                                Text(lisenceData[0]['Name']),
                                Text(lisenceData[0]['Licence_No'].toString()),
                                Text(lisenceData[0]['Authorization_To_Drive']
                                    .toString()),
                                Text(lisenceData[0]['Date_of_Issue']
                                    .toString()
                                    .substring(0, 13)),
                                Text(lisenceData[0]['DOB']
                                    .toString()
                                    .substring(0, 13)),
                                Text(lisenceData[0]['relation']),
                                Text(lisenceData[0]['Blood_Group'].toString()),
                                Text(lisenceData[0]['validity']
                                    .toString()
                                    .substring(0, 13)),
                                Text(lisenceData[0]['Permanent_Address']),
                                Text(lisenceData[0]['Present_Address']),
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
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0),
                                  border: Border.all(
                                      color: const Color.fromARGB(255, 7, 7, 7)
                                          .withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Image.network(
                                '$baseUrl/static/images/${lisenceData[0]['photo']}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0),
                                  border: Border.all(
                                      color: const Color.fromARGB(255, 7, 7, 7)
                                          .withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Image.network(
                                '$baseUrl/static/QR/${lisenceData[0]['qr']}',
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
