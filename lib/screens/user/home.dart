import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/auth/login.dart';
import 'package:smart_license/customwidget/container.dart';
import 'package:smart_license/screens/profilescreen.dart';
import 'package:smart_license/screens/user/about.dart';
import 'package:smart_license/screens/user/showvechicle.dart';
import 'package:smart_license/screens/user/viewlicense.dart';
import 'package:smart_license/screens/user/viewnotification.dart';
import 'package:smart_license/utils/api/getLisenceApi.dart';
import 'package:smart_license/utils/api/getVehicleApi.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: ListTile(
                title: Text(profileDatas[0]['Name'] ?? 'not available'),
                subtitle: Text(profileDatas[0]['Email'] ?? 'not available'),
                trailing: IconButton(
                  onPressed: () {
                    navigation(context, ProfileThreePage());
                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined),
                ),
                leading: InkWell(
                  onTap: () {
                    navigation(context, ProfileThreePage());
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        '$baseUrl/static/images/${profileDatas[0]['photo']}'),
                    radius: 20,
                  ),
                ),
              ),
            ),
            // ListTile(
            //   onTap: () {},
            //   title: Text('data'),
            // )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/BK.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Icon(Icons.menu),
                  ),
                  Row(
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
                      )
                    ],
                  ),
                  SizedBox(width: 50), // Adjust the space between elements
                ],
              ),
            ),
            SizedBox(height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    List<Map<String, dynamic>> data =
                        await getVehicleUser(adhar);
                    navigation(
                      context,
                      viewvechicle(
                        vehicledetails: data,
                      ),
                    );
                    print("ok");
                  },
                  child: CustomeContainer(
                    label: "Vehicle",
                    icon: Icons.drive_eta_outlined,
                  ),
                ),
                SizedBox(width: 25),
                InkWell(
                  onTap: () async {
                    List<Map<String, dynamic>> data = await getLisence();
                    navigation(
                      context,
                      ShowLisence(
                        liseccsdata: data,
                      ),
                    );
                    print("license");
                  },
                  child: CustomeContainer(
                    label: "License",
                    icon: Icons.document_scanner_outlined,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    navigation(context, AboutScreen());
                  },
                  child: CustomeContainer(
                    label: "About",
                    icon: Icons.assignment_late_outlined,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Perform logout action
                    navigationreplace(context, Login());
                  },
                  child: CustomeContainer(
                    label: "Logout",
                    icon: Icons.logout,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
