import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Function(String)? onChange;
  final String title;
  const TextFormFieldWidget({
    super.key,
    required this.htController,
    required this.onChange,
    required this.title,
  });

  final TextEditingController htController;
  //final IMCNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(
          color: Colors.purple,
        ),
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.purple, fontSize: 25.0),
      controller: htController,
      onChanged: onChange,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Insira sua altura.';
        }
        return null;
      },
    );
  }
}
