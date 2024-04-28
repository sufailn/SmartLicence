import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

class PendingFine extends StatelessWidget {
  const PendingFine({Key? key, this.finedata}) : super(key: key);
  final finedata;

  @override
  Widget build(BuildContext context) {
    // Dummy list of fines, you should replace it with your actual data.
    if (finedata.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text('View Pending Fines'),
        ),
        body: Center(
          child: Text('No Pending fines'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('View Pending Fines'),
      ),
      body: ListView.builder(
        itemCount: finedata.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: GestureDetector(
                onTap: () {
                  navigation(
                      context,
                      ImageView(
                        url:
                            '$baseUrl/static/images/${finedata[index]['photo']}',
                      ));
                },
                child: Container(
                  width: 50, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '$baseUrl/static/images/${finedata[index]['photo']}'),
                    ),
                  ),
                ),
              ),
              title: Text(finedata[index]['offence']),
              trailing: Text('₹ ' + finedata[index]['fineamount']));
        },
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.url});
  final url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.network(url),
          ),
        ],
      ),
    );
  }
}
