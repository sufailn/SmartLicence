import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_license/customwidget/container.dart';
import 'package:smart_license/main.dart';
import 'package:smart_license/screens/profilescreen.dart';

class trafficHomescreen extends StatelessWidget {
  trafficHomescreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      //   iconTheme: IconThemeData(color: Color.fromARGB(255, 5, 13, 251)),
      //   title: Text("Home"),
      //   actions: [
      //     Icon(Icons.notification_important_sharp),
      //     SizedBox(width: 10)
      //   ],
      // ),

      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: ListTile(
              title: Text('Name'),
              subtitle: Text('name@gmail.com'),
              trailing: IconButton(
                  onPressed: () {
                    navigation(context, ProfileThreePage());
                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined)),
              leading: InkWell(
                onTap: () {
                  navigation(context, ProfileThreePage());
                },
                child: CircleAvatar(
                  radius: 20,
                ),
              ),
            )),
            ListTile(
              onTap: () {},
              title: Text('data'),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 752,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: Image.asset(
                      "assets/images/tfchome.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              ],
            ),
            Positioned(
              top: 10,
              child: Container(
                width: width,
                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Icon(Icons.menu)),
                        Text(
                          "Smart ",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "License.",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 8),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: Colors.white.withOpacity(0),
                    //         border:
                    //             Border.all(color: Colors.red.withOpacity(0.5)),
                    //         borderRadius: BorderRadius.circular(7)),
                    //     width: 200,
                    //     child: CupertinoSearchTextField(),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.050,
              top: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print("ok");
                    },
                    child: CustomeContainer(
                      label: "vehicle",
                      icon: Icons.drive_eta_outlined,
                    ),
                  ),
                  SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      print("license");
                    },
                    child: CustomeContainer(
                      label: "license",
                      icon: Icons.document_scanner_outlined,
                    ),
                  ),
                  SizedBox(width: 15),
                  CustomeContainer(
                    label: "Notification",
                    icon: Icons.notifications_on_outlined,
                  ),
                  // SizedBox(width: 15),
                  // CustomeContainer(
                  //   label: "About",
                  //   icon: Icons.document_scanner_outlined,
                  // )
                ],
              ),
            ),
            Container(
              height: 20,
            ),
            Positioned(
              left: 100,
              top: 480, // Adjust the top position as needed
              child: CustomeContainer(
                  label: "About", icon: Icons.assignment_late_outlined),
            ),
            Positioned(
              left: 220,
              top: 480, // Adjust the top position as needed
              child: CustomeContainer(label: "logout", icon: Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}
