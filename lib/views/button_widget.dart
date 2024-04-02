// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  String text;
  String pathName;

  ButtonWidget({
    super.key,
    required this.text,
    required this.pathName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(pathName);
      },
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff6C563B),),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
            MediaQuery.sizeOf(context).width*0.9,
            MediaQuery.sizeOf(context).height*0.075) ,
        backgroundColor: const Color(0xffDCC7AD),
        shape:
          RoundedRectangleBorder(
            side: const BorderSide(
              width: 2,
              color: Color(0xff6C563B)
            ),
            borderRadius: BorderRadius.circular(20),
          ),

      ),
    );
  }
}
