import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:smart_license/customwidget/textfield.dart';
import 'package:smart_license/auth/login.dart';
import 'package:smart_license/auth/sighup.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController RpasswordController = TextEditingController();

  TextEditingController FNameController = TextEditingController();

  TextEditingController LNameController = TextEditingController();

  TextEditingController AddressController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController PhoneController = TextEditingController();

  TextEditingController Dobcontroller = TextEditingController();

  final ValueNotifier<bool> obsecure = ValueNotifier(true);

  final ValueNotifier<bool> confirm_obsecure = ValueNotifier(true);

  var formkey = GlobalKey<FormState>();

  final ValueNotifier<bool> check = ValueNotifier(true);

  int? _radioVal;

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
      body: Container(
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
                    top: 100, left: 40, right: 40, bottom: 30),
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
                              "First Name",
                              style: TextStyle(color: Colors.white),
                            ),
                            controller: FNameController,
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
                              Icons.person_2_outlined,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Last Name",
                              style: TextStyle(color: Colors.white),
                            ),
                            controller: LNameController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              style: TextStyle(color: Colors.white),
                              "Gender:",
                            ),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 0,
                                groupValue: _radioVal,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _radioVal = value;
                                      print(_radioVal);
                                    });
                                  }
                                },
                              ),
                              const Text(
                                style: TextStyle(color: Colors.white),
                                'Male ',
                              ),
                              Radio(
                                value: 1,
                                groupValue: _radioVal,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _radioVal = value;
                                      print(_radioVal);
                                    });
                                  }
                                },
                              ),
                              const Text(
                                  style: TextStyle(color: Colors.white),
                                  'Female '),
                              Radio(
                                value: 2,
                                groupValue: _radioVal,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _radioVal = value;
                                      print(_radioVal);
                                    });
                                  }
                                },
                              ),
                              const Text(
                                  style: TextStyle(color: Colors.white),
                                  'Others '),
                            ],
                          ),
                          customtextfield(
                            style: TextStyle(color: Colors.white),
                            keybordtype: TextInputType.emailAddress,
                            val: (value) {
                              if (value.toString().isEmpty) {
                                return 'invalid';
                              }
                              return null;
                            },
                            prefix: IconButton(
                                onPressed: () async {
                                  DateTime? newDateTime =
                                      await showRoundedDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(DateTime.now().year - 100),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                    borderRadius: 16,
                                    theme:
                                        ThemeData(primarySwatch: Colors.pink),
                                  );
                                  Dobcontroller.text =
                                      newDateTime.toString().substring(0, 10);
                                },
                                icon: Icon(
                                  Icons.calendar_month_rounded,
                                  color: Colors.white,
                                )),
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
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          customtextfield(
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
                          SizedBox(
                            height: 5,
                          ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable: check,
                                    builder: (context, value, child) {
                                      return Checkbox(
                                        value: check.value,
                                        onChanged: (value) {
                                          check.value = !check.value;
                                          print(check.value);
                                        },
                                      );
                                    },
                                  ),
                                  Text(
                                    "remember me?",
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("forgot password",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  print(usernameController.text);
                                  print(passwordController.text);
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
