import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewNotifications extends StatelessWidget {
  const ViewNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: Colors.red,
              child: ListTile(
                title: Text('due..'),
                subtitle: Text('sdfghjkl;'),
                trailing: ElevatedButton(onPressed: () {}, child: Text('pay')),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('title'),
                    subtitle: Text('descripppppppppppppppppppp'),
                    trailing: Text('23-23-2000'),
                  ),
                );
              },
              itemCount: 4,
            ))
          ],
        ),
      ),
    );
  }
}
