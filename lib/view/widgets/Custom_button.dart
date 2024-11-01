import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.imagepath,
      required this.text,
      required this.colorbutton,
      required this.fontcolor,
      this.onpressed});

  final String? imagepath;
  final String text;
  final Color colorbutton;
  final Color fontcolor;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (imagepath != null)
          Padding(
            padding: const EdgeInsets.only(
                right: 0), // Add some spacing between the image and the button
            child: Image.asset(
              imagepath!,
              height: 40, // Set the desired height for your image
              width: 40, // Set the desired width for your image
            ),
          ),
        Expanded(
          child: TextButtonTheme(
            data: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: fontcolor,
                backgroundColor: colorbutton, // Button background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                textStyle: const TextStyle(fontSize: 14),
              ),
            ),
            child: TextButton(
              onPressed: onpressed,
              child: Text(text),
            ),
          ),
        ),
      ],
    );
  }
}
