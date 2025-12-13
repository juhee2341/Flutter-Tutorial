import 'package:flutter/material.dart';

class OtpTextfieldWidget extends StatefulWidget {
  const OtpTextfieldWidget({
    super.key,
    required this.onChanged,
  });

  final void Function(String value) onChanged;

  @override
  State<OtpTextfieldWidget> createState() => _OtpTextfieldWidgetState();
}

class _OtpTextfieldWidgetState extends State<OtpTextfieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(2),
          child: Text(
            "+82",
            style: TextStyle(fontSize: 16),
          ),
        ),
        prefixIconConstraints: BoxConstraints(),
      ),
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        widget.onChanged(value);
      },
    );
  }
}
