import 'package:flutter/material.dart';
import 'package:smart_license/utils/api/loginApi.dart';

class ProfileThreePage extends StatelessWidget {
  static const String path = "lib/src/pages/profile/profile3.dart";

  ProfileThreePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 50,
              width: double.infinity,
              // child: PNetworkImage(
              //   image,
              //   fit: BoxFit.cover,
              // ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    profileDatas[0]['Name'],
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text(profileDatas[0]['Gender']),
                                  ),
                                  // const ListTile(
                                  //   contentPadding: EdgeInsets.all(0),
                                  //   title: Text("Licence No:LMV045111545"),
                                  // ),
                                  Text(
                                      "Licence No: ${profileDatas[0]['Licence_No'] ?? 'no lisence'}")
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            // Row(
                            //   children: <Widget>[
                            //     Expanded(
                            //       child: Column(
                            //         children: const <Widget>[
                            //           Text("285"),
                            //           Text("Likes")
                            //         ],
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: Column(
                            //         children: const <Widget>[
                            //           Text("3025"),
                            //           Text("Comments")
                            //         ],
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: Column(
                            //         children: const <Widget>[
                            //           Text("650"),
                            //           Text("Favourites")
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                    '$baseUrl/static/images/${profileDatas[0]['photo']}'),
                                fit: BoxFit.cover)),
                        margin: const EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("User information"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text(profileDatas[0]['Email'].toString()),
                          leading: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text("Phone"),
                          subtitle: Text(profileDatas[0]['Phone'].toString()),
                          leading: Icon(Icons.phone),
                        ),
                        // ListTile(
                        //   title: Text("Website"),
                        //   subtitle: Text("https://www.littlebutterfly.com"),
                        //   leading: Icon(Icons.web),
                        // ),

                        ListTile(
                          title: Text("Date of birth"),
                          subtitle: Text(profileDatas[0]['DOB'].toString()),
                          leading: Icon(Icons.calendar_view_day),
                        ),
                        ListTile(
                          title: Text("Address"),
                          subtitle: Text(profileDatas[0]['Present_Address']),
                          leading: Icon(Icons.person),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}
