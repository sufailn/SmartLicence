import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_license/customwidget/textfield.dart';
import 'package:smart_license/main.dart';
import 'package:smart_license/screens/user/home.dart';
import 'package:smart_license/screens/user/pendingFine.dart';
import 'package:smart_license/screens/user/viewAccesed.dart';
import 'package:smart_license/screens/user/viewnotification.dart';
import 'package:smart_license/utils/api/trafic/viewAccesedApi.dart';
import 'package:smart_license/utils/api/user/viewFineApi.dart';
import 'package:smart_license/utils/api/user/viewNotifi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

class viewvechicle extends StatelessWidget {
  const viewvechicle({super.key, this.vehicledetails});
  final vehicledetails;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    navigationreplace(context, Homescreen());
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
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
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: ExpansionTile(
                    expandedAlignment: Alignment.bottomLeft,
                    leading: CircleAvatar(),
                    title: Text(vehicledetails[index]['Makers_Name'] +
                        vehicledetails[index]['Makers_Classification']),
                    subtitle:
                        Text(vehicledetails[index]['Registration_number']),
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
                            padding: const EdgeInsets.all(4.5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          Text("Month of Manufactute"),
                                          Text("Year of Manufature"),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(vehicledetails[index]
                                                ['Registration_number']
                                            .toString()),
                                        Text(vehicledetails[index]
                                                ['Brief_discription'] ??
                                            'not available'),
                                        Text(vehicledetails[index]['Address'] ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                ['Makers_Name'] ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                ['Name_of_Regd_Owner'] ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                ['relation'] ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                ['Temporary_address'] ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                ['Class_of_vechicle'] ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                ['Makers_Classification'] ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                ['Type_of_body'] ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                    ['Chassis_Number']
                                                .toString() ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                    ['Engine_Number']
                                                .toString() ??
                                            'not available'),
                                        Text(vehicledetails[index]['Fuel'] ??
                                            'not available'),
                                        Text(vehicledetails[index]['Colour'] ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                    ['Month_of_Manufacture']
                                                .toString() ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                    ['Year_of_Manufacture']
                                                .toString() ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                    ['Horse_Power']
                                                .toString() ??
                                            'not available'),
                                        Text(vehicledetails[index]['Weight']
                                                .toString() ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                    ['Number_of_cilinders']
                                                .toString() ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                    ['Seating_Capacity']
                                                .toString() ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                    ['Tax_licence_No']
                                                .toString() ??
                                            'not available'),
                                        Text(vehicledetails[index]
                                                    ['Date_of_Delivery']
                                                .toString() ??
                                            'not available'),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: () async {
                                        List<Map<String, dynamic>> data =
                                            await getPendingfine(
                                                vehicledetails[index]
                                                    ['Registration_number']);
                                        navigation(
                                            context,
                                            PendingFine(
                                              finedata: data,
                                            ));
                                      },
                                      child: Text(
                                        "pending fine ⚠️ ",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        List<Map<String, dynamic>> data =
                                            await getAccessedList(
                                                vehicledetails[index]
                                                    ['Registration_number']);
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
                                    TextButton(
                                      onPressed: () async {
                                        List<Map<String, dynamic>> data =
                                            await getNotifivcation(
                                                vehicledetails[index]
                                                    ['Registration_number']);
                                        navigation(
                                            context,
                                            ViewNotifications(
                                              vehicleNo: vehicledetails[index]
                                                  ['Registration_number'],
                                              notifications: data,
                                            ));
                                      },
                                      child: Text(
                                        "notification 🔔",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ));
                },
                itemCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
