import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/utils/api/user/viewNotifi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

class ViewNotifications extends StatelessWidget {
  const ViewNotifications({super.key, this.notifications, this.vehicleNo});
  final notifications;
  final vehicleNo;

  @override
  Widget build(BuildContext context) {
    if (notifications.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: Center(
          child: Text('No Data'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
              height: 10,
            ),
            // Card(
            //   color: Colors.red,
            //   child: ListTile(
            //     title: Text('Fine'),
            //     subtitle: Text('fine for helmet'),
            //     trailing: ElevatedButton(onPressed: () {}, child: Text('pay')),
            //   ),
            // ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(255, 235, 235, 236),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                              'VehicleNo: ${notifications[index]['vehicle_no']} '),
                          subtitle: Text(
                            'LisenceNo: ${notifications[index]['licence_number']} ',
                          ),
                          trailing:
                              Text('DAte:  ${notifications[index]['time']}'),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await acceptrequest(vehicleNo);
                                      List<Map<String, dynamic>> data =
                                          await getNotifivcation(vehicleNo);
                                      navigationreplace(
                                          context,
                                          ViewNotifications(
                                            vehicleNo: vehicleNo,
                                            notifications: data,
                                          ));
                                    },
                                    child: Text('Accept'),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green))),
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await rejectrequest(vehicleNo);
                                      List<Map<String, dynamic>> data =
                                          await getNotifivcation(vehicleNo);
                                      navigationreplace(
                                          context,
                                          ViewNotifications(
                                            vehicleNo: vehicleNo,
                                            notifications: data,
                                          ));
                                    },
                                    child: Text('Reject'),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red)))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: notifications.length,
            ))
          ],
        ),
      ),
    );
  }
}
