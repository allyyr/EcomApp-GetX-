import 'package:flutter/material.dart';
import 'package:summer1/view/widgets/Custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.text,
    this.hint,
    this.onsave,
    this.validation,
  }) : super(key: key);

  final String text;
  final String? hint;
  final FormFieldSetter<String>? onsave;
  final FormFieldValidator<String>? validation;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: text,
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
          ),
          TextFormField(
            onSaved: onsave,
            validator: validation,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
