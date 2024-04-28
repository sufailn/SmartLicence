import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_license/auth/forgotpassword.dart';
import 'package:smart_license/customwidget/textfield.dart';
import 'package:smart_license/auth/sighup.dart';
import 'package:smart_license/utils/api/loginApi.dart';
import 'package:smart_license/utils/common/snackbar.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController usernameController =
      TextEditingController(text: 'SUFAILAHMD990@GMAIL.COM');
  TextEditingController passwordController =
      TextEditingController(text: 'Suf@123');

  final ValueNotifier<bool> obsecure = ValueNotifier(true);
  var formkey = GlobalKey<FormState>();
  final ValueNotifier<bool> check = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Color.fromARGB(255, 5, 13, 251)),
      //   backgroundColor: const Color.fromARGB(31, 248, 20, 20),
      //   title: Text("Smart license"),
      //   leading: Icon(Icons.car_rental_outlined),
      //   actions: [
      //     Icon(Icons.notification_important_sharp),
      //     SizedBox(width: 10)
      //   ],
      // ),
      drawer: Drawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/loginbg.png'),
              colorFilter: ColorFilter.mode(
                  const Color.fromARGB(139, 0, 0, 0), BlendMode.colorBurn),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 30),
          child: Form(
            key: formkey,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(116, 23, 22, 22),
                  // color: Colors.blue[900],
                  border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 6,
                        color: Colors.black,
                        offset: Offset.infinite,
                        blurStyle: BlurStyle.solid,
                        blurRadius: 6.0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customtextfield(
                      keybordtype: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      val: (value) {
                        if (value.toString().isEmpty) {
                          return 'invalid';
                        } else if (!value.toString().contains('@')) {
                          return 'invalid email';
                        }
                        return null;
                      },
                      prefix: Icon(
                        Icons.person_2_outlined,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Email",
                        style: TextStyle(color: Colors.white),
                      ),
                      controller: usernameController,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ValueListenableBuilder(
                      valueListenable: obsecure,
                      builder: (context, value, child) {
                        return customtextfield(
                          style: TextStyle(color: Colors.white),
                          val: (value) {
                            if (value.toString().isEmpty) {
                              return 'invalid';
                            }
                            return null;
                          },
                          prefix: Icon(
                            Icons.lock_outline_sharp,
                            color: Colors.white,
                          ),
                          label: Text(
                            'password',
                            style: TextStyle(color: Colors.white),
                          ),
                          controller: passwordController,
                          obsecure: obsecure.value,
                          suffix: IconButton(
                            icon: obsecure.value
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  ),
                            onPressed: () {
                              obsecure.value = !obsecure.value;
                              print(obsecure.value);
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         ValueListenableBuilder(
                    //           valueListenable: check,
                    //           builder: (context, value, child) {
                    //             return Checkbox(
                    //               value: check.value,
                    //               onChanged: (value) {
                    //                 check.value = !check.value;
                    //                 print(check.value);
                    //               },
                    //             );
                    //           },
                    //         ),
                    //         // Text(
                    //         //   "remember me?",
                    //         //   style: TextStyle(color: Colors.amber),
                    //         // )
                    //       ],
                    //     ),

                    //   ],
                    // ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          navigation(context, Forgotpassword());
                        },
                        child: Text(
                          "forgot password?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            print(usernameController.text);
                            print(passwordController.text);
                            await loginUser(usernameController.text,
                                passwordController.text, context);
                          }
                        },
                        child: Text("Login"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "if you don't have an account",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (cont) => Signup()),
                            );
                          },
                          child: Text("sign up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
