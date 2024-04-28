import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:smart_license/utils/api/user/forgotpassApi.dart';

class OtpSctreen extends StatefulWidget {
  const OtpSctreen({Key? key, this.email}) : super(key: key);
  final email;
  @override
  State<OtpSctreen> createState() => _OtpSctreenState();
}

class _OtpSctreenState extends State<OtpSctreen> {
  TextEditingController _passwordController = TextEditingController();
  String otp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginbg.png'),
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(139, 0, 0, 0),
              BlendMode.colorBurn,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              OtpTextField(
                textStyle: TextStyle(color: Colors.white),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                // set to true to show as box or false to show as dash
                showFieldAsBox: true,
                // runs when a code is typed in
                onCodeChanged: (String code) {
                  otp = '';
                  setState(() {});
                  // handle validation or checks here
                },
                // runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  otp = verificationCode;
                  setState(() {});
                }, // end onSubmit
              ),
              SizedBox(height: 20),
              if (otp != '')
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Container(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    // Handle submit button press here
                    await senNewpass(
                        widget.email, otp, _passwordController.text, context);
                  },
                  child: Text(
                    'Submit',
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
