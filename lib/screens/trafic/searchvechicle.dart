import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/main.dart';
import 'package:smart_license/screens/trafic/fine.dart';
import 'package:smart_license/screens/trafic/traffichome.dart';
import 'package:smart_license/screens/user/home.dart';
import 'package:smart_license/screens/user/viewAccesed.dart';
import 'package:smart_license/screens/user/viewnotification.dart';
import 'package:smart_license/utils/api/getVehicleApi.dart';
import 'package:smart_license/utils/api/trafic/viewAccesedApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

class Searchvechicle extends StatefulWidget {
  Searchvechicle({super.key});

  @override
  State<Searchvechicle> createState() => _SearchvechicleState();
}

class _SearchvechicleState extends State<Searchvechicle> {
  TextEditingController searchcontroll = TextEditingController();

  List<Map<String, dynamic>> vehicledatas = [];

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
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    border: Border.all(color: Colors.red.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(7)),
                width: 250,
                child: CupertinoSearchTextField(
                  placeholder: 'KL10AC1008',
                  onChanged: (value) => value.toUpperCase(),
                  controller: searchcontroll,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                vehicledatas = await getVehicletrafic(searchcontroll.text);
                setState(() {});
              },
              child: Text("Search Vechicle"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.red),
            ),
            SizedBox(
              height: 5,
            ),
            if (vehicledatas.length != 0)
              Card(
                  child: ExpansionTile(
                expandedAlignment: Alignment.bottomLeft,
                leading: CircleAvatar(),
                title: Text(vehicledatas[0]['Makers_Name'] +
                    vehicledatas[0]['Makers_Classification']),
                subtitle: Text(vehicledatas[0]['Registration_number']),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Registration number: "),
                                  Text("Brief discription: "),
                                  Text("Address"),
                                  Text("Makers Name"),
                                  Text("Name of Regd Owner"),
                                  Text("S/o,d/o,w/o"),
                                  Text("Temporary adress"),
                                  Text("Class of vechicle"),
                                  Text("Makers Classification"),
                                  Text("Type of body"),
                                  Text("Chassis Number"),
                                  Text("Engine Number"),
                                  Text("Fuel"),
                                  Text("Colour"),
                                  Text("Month of Manufacture"),
                                  Text("Year of Manufacture"),
                                  Text("Horse Power"),
                                  Text("Weight"),
                                  Text("Number of cilinders"),
                                  Text("Seating Capacity"),
                                  Text("Tax licence No."),
                                  Text("Date of Delivery"),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(vehicledatas[0]['Registration_number']
                                    .toString()),
                                Text(vehicledatas[0]['Brief_discription'] ??
                                    'not available'),
                                Text(vehicledatas[0]['Address'] ??
                                    'not available'),
                                Text(vehicledatas[0]['Makers_Name'] ??
                                    'not available'),
                                Text(vehicledatas[0]['Name_of_Regd_Owner'] ??
                                    'not available'),
                                Text(vehicledatas[0]['relation'] ??
                                    'not available'),
                                Text(vehicledatas[0]['Temporary_address'] ??
                                    'not available'),
                                Text(vehicledatas[0]['Class_of_vechicle'] ??
                                    'not available'),
                                Text(vehicledatas[0]['Makers_Classification'] ??
                                    'not available'),
                                Text(vehicledatas[0]['Type_of_body'] ??
                                    'not available'),
                                Text(vehicledatas[0]['Chassis_Number']
                                        .toString() ??
                                    'not available'),
                                Text(vehicledatas[0]['Engine_Number']
                                        .toString() ??
                                    'not available'),
                                Text(
                                    vehicledatas[0]['Fuel'] ?? 'not available'),
                                Text(vehicledatas[0]['Colour'] ??
                                    'not available'),
                                Text(vehicledatas[0]['Month_of_Manufacture']
                                        .toString() ??
                                    'not available'),
                                Text(vehicledatas[0]['Year_of_Manufacture']
                                        .toString() ??
                                    'not available'),
                                Text(
                                    vehicledatas[0]['Horse_Power'].toString() ??
                                        'not available'),
                                Text(vehicledatas[0]['Weight'].toString() ??
                                    'not available'),
                                Text(vehicledatas[0]['Number_of_cilinders']
                                        .toString() ??
                                    'not available'),
                                Text(vehicledatas[0]['Seating_Capacity']
                                        .toString() ??
                                    'not available'),
                                Text(vehicledatas[0]['Tax_licence_No']
                                        .toString() ??
                                    'not available'),
                                Text(vehicledatas[0]['Date_of_Delivery']
                                        .toString() ??
                                    'not available'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () async {
                          List<Map<String, dynamic>> data =
                              await getAccessedList(
                                  vehicledatas[0]['Registration_number']);
                          navigation(
                              context,
                              ViewAccessed(
                                accessed: data,
                              ));
                        },
                        child: Text(
                          "View Accessed",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            navigation(
                                context,
                                Fine(
                                  vnumber: vehicledatas[0]
                                      ['Registration_number'],
                                ));
                          },
                          child: Text('Sent Fine')),
                    ],
                  )
                ],
              ))
          ],
        ),
      ),
    );
  }
}
