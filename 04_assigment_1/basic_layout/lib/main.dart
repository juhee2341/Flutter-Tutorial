import 'package:basic_layout/feature/food_recipe/presentation/food_recipe_screen.dart';
import 'package:basic_layout/feature/food_recipe/presentation/view_model/food_recipe_view_model.dart';
import 'package:basic_layout/feature/otp_verification/otp_verification_screen.dart';
import 'package:basic_layout/feature/text_input/text_input_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: OtpVerificationScreen());
  }
}
