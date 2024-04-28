import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:smart_license/customwidget/textfield.dart';
import 'package:smart_license/auth/login.dart';
import 'package:smart_license/auth/sighup.dart';
import 'package:smart_license/utils/api/registerApi.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController RpasswordController = TextEditingController();

  TextEditingController NameController = TextEditingController();

  TextEditingController AddressController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController PhoneController = TextEditingController();

  TextEditingController Dobcontroller = TextEditingController();
  TextEditingController adhaarcontroller = TextEditingController();

  final ValueNotifier<bool> obsecure = ValueNotifier(true);

  final ValueNotifier<bool> confirm_obsecure = ValueNotifier(true);

  var formkey = GlobalKey<FormState>();

  final ValueNotifier<bool> check = ValueNotifier(true);

  int? _radioVal;

  List<Map<String, dynamic>> regDatas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/loginbg.png'),
              colorFilter: ColorFilter.mode(
                  const Color.fromARGB(139, 0, 0, 0), BlendMode.colorBurn),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 100, left: 30, right: 30, bottom: 30),
                child: Form(
                  key: formkey,
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Colors.blue[900],
                        border: Border.all(
                            color: Color.fromARGB(255, 87, 110, 241)),
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
                            "Sign Up",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          customtextfield(
                            keybordtype: TextInputType.number,
                            suffix: Container(
                              height: 20,
                              width: 90,
                              child: TextButton(
                                child: Text(
                                  'Browse',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  regDatas = await getUsedatas(
                                      adhaarcontroller.text, context);

                                  genderController.text = regDatas[0]['Gender'];

                                  NameController.text =
                                      regDatas[0]['Name_of_Regd_Owner'];
                                  AddressController.text =
                                      regDatas[0]['Address'];

                                  EmailController.text = regDatas[0]['email'];

                                  PhoneController.text =
                                      regDatas[0]['Phone'].toString();

                                  Dobcontroller.text =
                                      regDatas[0]['DOB'].toString();
                                },
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            val: (value) {
                              if (value.toString().isEmpty) {
                                return 'invalid';
                              }
                              return null;
                            },
                            prefix: Icon(
                              Icons.adobe_sharp,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Adhaar number",
                              style: TextStyle(color: Colors.white),
                            ),
                            controller: adhaarcontroller,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          customtextfield(
                            style: TextStyle(color: Colors.white),
                            val: (value) {
                              if (value.toString().isEmpty) {
                                return 'invalid';
                              }
                              return null;
                            },
                            prefix: Icon(
                              Icons.person_2,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Name",
                              style: TextStyle(color: Colors.white),
                            ),
                            controller: NameController,
                            readonly: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          customtextfield(
                            style: TextStyle(color: Colors.white),
                            val: (value) {
                              if (value.toString().isEmpty) {
                                return 'invalid';
                              }
                              return null;
                            },
                            prefix: Icon(
                              Icons.person_2,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Gender",
                              style: TextStyle(color: Colors.white),
                            ),
                            controller: genderController,
                            readonly: true,
                          ),
                          // Align(
                          //   alignment: Alignment.bottomLeft,
                          //   child: Text(
                          //     style: TextStyle(color: Colors.white),
                          //     "Gender:",
                          //   ),
                          // ),
                          // Row(
                          //   children: [
                          //     Radio(
                          //       value: 0,
                          //       groupValue: _radioVal,
                          //       onChanged: (value) {
                          //         if (value != null) {
                          //           setState(() {
                          //             _radioVal = value;
                          //             print(_radioVal);
                          //           });
                          //         }
                          //       },
                          //     ),
                          //     const Text(
                          //       style: TextStyle(color: Colors.white),
                          //       'Male ',
                          //     ),
                          //     Radio(
                          //       value: 1,
                          //       groupValue: _radioVal,
                          //       onChanged: (value) {
                          //         if (value != null) {
                          //           setState(() {
                          //             _radioVal = value;
                          //             print(_radioVal);
                          //           });
                          //         }
                          //       },
                          //     ),
                          //     const Text(
                          //         style: TextStyle(color: Colors.white),
                          //         'Female '),
                          //     Radio(
                          //       value: 2,
                          //       groupValue: _radioVal,
                          //       onChanged: (value) {
                          //         if (value != null) {
                          //           setState(() {
                          //             _radioVal = value;
                          //             print(_radioVal);
                          //           });
                          //         }
                          //       },
                          //     ),
                          //     const Text(
                          //         style: TextStyle(color: Colors.white),
                          //         'Others '),
                          //   ],
                          // ),
                          customtextfield(
                            style: TextStyle(color: Colors.white),
                            keybordtype: TextInputType.emailAddress,
                            val: (value) {
                              if (value.toString().isEmpty) {
                                return 'invalid';
                              }
                              return null;
                            },
                            readonly: true,
                            prefix: Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.white,
                            ),
                            label: Text("DOB",
                                style: TextStyle(color: Colors.white)),
                            controller: Dobcontroller,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          customtextfield(
                            style: TextStyle(color: Colors.white),
                            val: (value) {
                              if (value.toString().isEmpty) {
                                return 'invalid';
                              }
                              return null;
                            },
                            prefix: Icon(Icons.location_city_outlined,
                                color: Colors.white),
                            label: Text(
                              "Address",
                              style: TextStyle(color: Colors.white),
                            ),
                            controller: AddressController,
                            readonly: true,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          customtextfield(
                            readonly: true,
                            style: TextStyle(color: Colors.white),
                            keybordtype: TextInputType.phone,
                            val: (value) {
                              if (value.toString().isEmpty) {
                                return 'invalid';
                              }
                              return null;
                            },
                            prefix:
                                Icon(Icons.phone_android, color: Colors.white),
                            label: Text("Phone Number",
                                style: TextStyle(color: Colors.white)),
                            controller: PhoneController,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          customtextfield(
                            readonly: true,
                            style: TextStyle(color: Colors.white),
                            keybordtype: TextInputType.emailAddress,
                            val: (value) {
                              if (value.toString().isEmpty) {
                                return 'invalid';
                              }
                              return null;
                            },
                            prefix:
                                Icon(Icons.email_outlined, color: Colors.white),
                            label: Text("Email",
                                style: TextStyle(color: Colors.white)),
                            controller: EmailController,
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // customtextfield(
                          //   style: TextStyle(color: Colors.white),
                          //   val: (value) {
                          //     if (value.toString().isEmpty) {
                          //       return 'invalid';
                          //     }
                          //     return null;
                          //   },
                          //   prefix: Icon(Icons.assignment_ind_outlined,
                          //       color: Colors.white),
                          //   label: Text("user name",
                          //       style: TextStyle(color: Colors.white)),
                          //   controller: usernameController,
                          // ),
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
                                  } else if (value.toString().length < 6) {
                                    return 'password must contain at least 6 characters';
                                  } else if (!RegExp(r'^(?=.*[0-9])(?=.*[A-Z])')
                                      .hasMatch(value.toString())) {
                                    return 'password must contain at least one number and one capital letter';
                                  }
                                  return null;
                                },
                                prefix: Icon(Icons.lock, color: Colors.white),
                                label: Text("password",
                                    style: TextStyle(color: Colors.white)),
                                controller: passwordController,
                                obsecure: obsecure.value,
                                suffix: IconButton(
                                  icon: obsecure.value
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
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
                          ValueListenableBuilder(
                            valueListenable: confirm_obsecure,
                            builder: (context, value, child) {
                              return customtextfield(
                                style: TextStyle(color: Colors.white),
                                val: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'invalid';
                                  } else if (value != passwordController.text) {
                                    return "password does't match";
                                  }
                                  return null;
                                },
                                prefix: Icon(Icons.lock_outline_sharp,
                                    color: Colors.white),
                                label: Text("confirm password",
                                    style: TextStyle(color: Colors.white)),
                                controller: RpasswordController,
                                obsecure: confirm_obsecure.value,
                                suffix: IconButton(
                                  icon: confirm_obsecure.value
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onPressed: () {
                                    confirm_obsecure.value =
                                        !confirm_obsecure.value;
                                  },
                                ),
                              );
                            },
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
                          //         Text(
                          //           "remember me?",
                          //           style: TextStyle(color: Colors.amber),
                          //         ),
                          //       ],
                          //     ),

                          //   ],
                          // ),
                          Container(
                            height: 50,
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  // print(usernameController.text);
                                  print(passwordController.text);

                                  await registerUser(
                                      EmailController.text,
                                      passwordController.text,
                                      adhaarcontroller.text,
                                      context);
                                }
                              },
                              child: Text("Sign up"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("if you  have an account",
                                  style: TextStyle(color: Colors.white)),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (cont) => Login()),
                                  );
                                },
                                child: Text("LOGIN"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
