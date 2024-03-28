import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/main.dart';
import 'package:smart_license/screens/trafic/traffichome.dart';

class trafficnotification extends StatelessWidget {
  const trafficnotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            navigationreplacement(context, trafficHomescreen());
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
                    title: Text('title'),
                    subtitle: Text('description'),
                    trailing: Text('23-23-2000'),
                  ),
                );
              },
              itemCount: 3,
            ))
          ],
        ),
      ),
    );
  }
}
