import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_license/customwidget/textfield.dart';
import 'package:smart_license/utils/api/user/forgotpassApi.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // You can add more sophisticated email validation logic here
    // For simplicity, I'm just checking if it contains '@'
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void _sendResetLink() async {
    if (_formKey.currentState!.validate()) {
      // Implement your logic to send reset link
      await sendOtp(_emailController.text, context);
      // You can handle sending reset link here
    }
  }

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
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  customtextfield(
                    style: TextStyle(color: Colors.white),
                    controller: _emailController,
                    keybordtype: TextInputType.emailAddress,
                    label: Text(
                      'Email',
                      style: TextStyle(color: Colors.white),
                    ),
                    val: _validateEmail,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: _sendResetLink,
                      child: Text('Send'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
