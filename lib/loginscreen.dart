import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_app_1/otpscreenpage.dart';
import 'package:testing_app_1/registrationpage.dart';
import 'package:testing_app_1/sharedpreference.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FnameController = TextEditingController();

  final mobileController = TextEditingController();
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),

            Center(
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: FnameController,
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            SizedBox(height: 5),

            Text(
              "Note: Name should be same as First Name Middle Name Last Name.",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            SizedBox(height: 10),

            TextField(
              controller: mobileController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // only numbers
                LengthLimitingTextInputFormatter(10), // max 10 digits
              ],

              decoration: InputDecoration(labelText: "Mobile Number"),
            ),
            SizedBox(height: 5),

            Text(
              "Note: Mobile number is same as WhatsApp number.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 10),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (FnameController.text.isEmpty ||
                        mobileController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all details")),
                      );
                      return;
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                    }
                    await Sharedpreference.saveLogin(
                      FnameController.text,
                      mobileController.text,
                    );
                  },
                  child: Text("Login"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      FnameController.clear();

                      mobileController.clear();
                    });
                  },
                  child: Text("Reset"),
                ),
              ],
            ),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: GestureDetector(
              
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registrationpage()),
                  );
                },
                child: Text(
                  "Register Your Self",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
              
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
