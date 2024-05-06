import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/main.dart';
import 'package:smart_license/screens/trafic/traffichome.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewAccessed extends StatelessWidget {
  const ViewAccessed({super.key, this.accessed});
  final accessed;

  @override
  Widget build(BuildContext context) {
    if (accessed.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Accessed'),
        ),
        body: Center(
          child: Text('No Data'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Card(
            //   color: Colors.red,
            //   child: ListTile(
            //       // title: Text('due..'),
            //       // subtitle: Text('sdfghjkl;'),
            //       // trailing: ElevatedButton(onPressed: () {}, child: Text('pay')),
            //       ),
            // ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          '$baseUrl/static/images/${accessed[index]['photo']}'),
                    ),
                    title: Text('Lisence No: ${accessed[index]['Licence_No']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Name: ${accessed[index]['Name']}  \nAlcohol: ${accessed[index]['alcohol']}   \nSpeed: ${accessed[index]['speed']}  '),
                        Row(
                          children: [
                            Text('Phone: '),
                            TextButton(
                              onPressed: () {
                                _launchDialer(accessed[index]['Phone']);
                              },
                              child: Text(accessed[index]['Phone'].toString()),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              _launchGoogleMaps(accessed[index]['latitude'],
                                  accessed[index]['longitude']);
                            },
                            child: Text('ViewMap'))
                      ],
                    ),
                    trailing: Text('Time: ${accessed[index]['time']}'),
                  ),
                );
              },
              itemCount: accessed.length,
            ))
          ],
        ),
      ),
    );
  }

  _launchDialer(numbr) async {
    // const phoneNumber = '1234567890'; // Replace with your desired phone number
    final url = 'tel:$numbr';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchGoogleMaps(lati, log) async {
    // final latitude = 37.7749; // Replace with your latitude
    // final longitude = -122.4194; // Replace with your longitude
    final url = 'https://www.google.com/maps?q=$lati,$log';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
