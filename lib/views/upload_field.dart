// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UploadField extends StatelessWidget {
  String textOut;
  String textIn;

  UploadField({
    super.key,
    required this.textOut,
    required this.textIn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textOut,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff6C563B)),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextField(

          decoration: InputDecoration(
            fillColor: const Color(0xffDCC7AD),
              filled: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              hintText: textIn,
              hintStyle: const TextStyle(
                color: Color(0xff6C563B),
                fontSize: 16,
                fontWeight: FontWeight.w300
              ),
              contentPadding: const EdgeInsets.all(16)),
        ),
      ),
    ]);
  }
}
