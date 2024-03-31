import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewNotifications extends StatelessWidget {
  const ViewNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // title: Text('Notifications'),
      //     ),
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
            Card(
              color: Colors.red,
              child: ListTile(
                title: Text('Fine'),
                subtitle: Text('fine for helmet'),
                trailing: ElevatedButton(onPressed: () {}, child: Text('pay')),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('title'),
                    subtitle: Text(
                      'discription',
                    ),
                    trailing: Text('23-23-2000'),
                  ),
                );
              },
              itemCount: 2,
            ))
          ],
        ),
      ),
    );
  }
}
