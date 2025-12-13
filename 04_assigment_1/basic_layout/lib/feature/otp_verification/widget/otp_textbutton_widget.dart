import 'package:flutter/material.dart';

class OtpTextbuttonWidget extends StatelessWidget {
  const OtpTextbuttonWidget({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    print("OtpTextbuttonWidget render");
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        minimumSize: const Size(300, 50),
      ),
      child: const Text("Get OTP"),
    );
  }
}
