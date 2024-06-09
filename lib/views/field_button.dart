import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FieldButton extends StatelessWidget {
  String insideText;

  String outsideText;

  String pathName;

  FieldButton(
      {super.key, required this.insideText,
      required this.outsideText,
      required this.pathName, required TextEditingController controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            outsideText,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff6C563B)),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffDCC7AD),
                isDense: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent)),
                hintText: insideText,
                hintStyle: const TextStyle(
                  color: Color(0xff6C563B),
                  fontSize: 16,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Image.asset(pathName),
                ),
                contentPadding: const EdgeInsets.all(15)),
          ),
        )
      ],
    );
  }
}
