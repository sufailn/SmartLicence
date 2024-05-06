import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/auth/login.dart';
import 'package:smart_license/customwidget/container.dart';
import 'package:smart_license/main.dart';
import 'package:smart_license/screens/profilescreen.dart';
import 'package:smart_license/screens/trafic/searchlicence.dart';
import 'package:smart_license/screens/trafic/searchvechicle.dart';
import 'package:smart_license/screens/user/about.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

class TrafficHomeScreen extends StatelessWidget {
  TrafficHomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 54, 167, 228),
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  profileDatas[0]['Name'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  profileDatas[0]['email'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      '$baseUrl/static/images/${profileDatas[0]['Profile_Photo']}'),
                ),
                decoration: BoxDecoration(),
              ),
              ListTile(
                leading: Icon(
                  Icons.supervised_user_circle_outlined,
                  color: Colors.white,
                ),
                onTap: () {
                  navigation(context, AboutScreen());
                },
                title: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onTap: () {
                  navigationreplace(context, Login());
                },
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/tfchome.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Icon(Icons.menu),
                        ),
                        Text(
                          "Smart ",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Licence.",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            navigation(context, Searchvechicle());
                          },
                          child: CustomeContainer(
                            label: "Vehicle",
                            icon: Icons.drive_eta_outlined,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            navigation(context, searchlicense());
                            print("Licence");
                          },
                          child: CustomeContainer(
                            label: "Licence",
                            icon: Icons.document_scanner_outlined,
                          ),
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     navigation(context, trafficnotification());
                        //   },
                        //   child: CustomeContainer(
                        //     label: "Notification",
                        //     icon: Icons.notifications_on_outlined,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(width: 40),
                      InkWell(
                        onTap: () {
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
