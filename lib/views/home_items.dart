// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeItem extends StatelessWidget {
  String pathName;
  String text;

  HomeItem({
    super.key,
    required this.pathName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.30,
      width: MediaQuery.sizeOf(context).width * 0.45,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(pathName, fit: BoxFit.fill, width: double.infinity),
              Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  child: Image.asset(
                    "assets/love.png",
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                height:24 ,
                  width: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Image.asset(
                          "assets/more.png",
                          height: 24,
                          width: 24,
                        ),
                      ),
                  ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
