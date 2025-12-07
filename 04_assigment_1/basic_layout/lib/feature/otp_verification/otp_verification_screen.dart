import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController mobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZCUyMHJlc3RhdXJhbnR8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                      fit: BoxFit.cover,
                      width: 300,
                      height: 300,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: child,
                            );
                          },
                    ),
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
                    TextField(
                      controller: mobileNumber,
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12), // 위치 예쁘게 정리
                          child: Text(
                            "+82",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    TextButton(
                      onPressed: () => {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        minimumSize: const Size(300, 50),
                      ),
                      child: const Text("Get OTP"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
