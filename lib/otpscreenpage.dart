import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("OTP Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Enter OTP",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "OTP sent to your mobile number",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            Pinput(
              length: 6,
              controller: otpController,
              defaultPinTheme: defaultPinTheme,
inputFormatters: [  FilteringTextInputFormatter.digitsOnly, // only numbers
                LengthLimitingTextInputFormatter(6),],
              onCompleted: (pin) {
                verifyOtp(pin);
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                verifyOtp(otpController.text);
              },
              child: const Text("Verify OTP"),
            ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                // resend otp
              },
              child: const Text("Resend OTP"),
            )

          ],
        ),
      ),
    );
  }

  void verifyOtp(String otp) {
    print("Entered OTP: $otp");
  }
}