import 'package:basic_layout/feature/otp_verification/widget/image_network_widget.dart';
import 'package:basic_layout/feature/otp_verification/widget/otp_textbutton_widget.dart';
import 'package:basic_layout/feature/otp_verification/widget/otp_textfield_widget.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String inputText = "";

  void _onInputChanged(String value) {
    setState(() {
      inputText = value;
    });
  }

  void _handlePress() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text('$inputText 등록 완료'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 40,
          left: 40,
          right: 40,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ImageNetworkWidget(),
              const Text(
                'OTP Verification',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                'We will send you a one-time password on this mobile number',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                'Enter Mobile Number',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(inputText),
              OtpTextfieldWidget(onChanged: _onInputChanged),
              OtpTextbuttonWidget(onPressed: _handlePress),
            ],
          ),
        ),
      ),
    );
  }
}
