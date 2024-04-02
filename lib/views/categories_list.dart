// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoriesList extends StatelessWidget {
  String text;

  String pathName;

  CategoriesList({
    super.key,
    required this.text,
    required this.pathName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Image.asset(pathName, fit: BoxFit.none),
        height: 65,
        width: 65,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
      ),
      const SizedBox(height: 10),
      Text(
        text,
        style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xff6C563B)),
      ),
      const SizedBox(height: 10),
    ]);
  }
}
