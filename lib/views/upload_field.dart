import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadField extends StatelessWidget {
  final String textOut;
  final String textIn;
  final TextEditingController controller;

  UploadField({
    super.key,
    required this.textOut,
    required this.textIn,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textOut,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6C563B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 389.w,
              height: 46.h,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: const Color(0xffDCC7AD),
                  filled: true,
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  hintText: textIn,
                  hintStyle: const TextStyle(
                    color: Color(0xff6C563B),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
