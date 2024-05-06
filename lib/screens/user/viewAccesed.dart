import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/main.dart';
import 'package:smart_license/screens/trafic/traffichome.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

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
                    subtitle: Text(
                        'Name: ${accessed[index]['Name']} \nPhone: ${accessed[index]['Phone']} \nAlcohol: ${accessed[index]['alcohol']}   \nSpeed: ${accessed[index]['speed']}  '),
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
}
