import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_craft/views/shopping_cart.dart';

class CarView extends StatefulWidget {
  const CarView({Key? key}) : super(key: key);

  @override
  _CarViewState createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  bool showDescription = false;
  bool showDetailsImage = false;

  void toggleDescription() {
    setState(() {
      showDescription = !showDescription;
      showDetailsImage = false;
    });
  }

  void toggleDetailsImage() {
    setState(() {
      showDetailsImage = !showDetailsImage;
      showDescription = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/car.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 17,
                    child: SizedBox(
                      width: 31.28,
                      height: 30.7,
                      child: TextButton(
                        onPressed: () {
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.69))
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    right: 17,
                    child: SizedBox(
                      width: 31.28,
                      height: 30.7,
                      child: TextButton(
                        onPressed: () {
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.69))
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 285, top: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: const Color.fromARGB(220, 199, 173, 1),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Transportation',
                          style: TextStyle(
                            backgroundColor: Color(0xffDCC7AD),
                            color: Color(0xff6C563B),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    const Text(
                      'Blue Car',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    const Text(
                      'LE 120',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: toggleDescription,
                    child: const Text(
                      'Description',
                      style: TextStyle(
                        color: Color(0xff6C563B),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  TextButton(
                    onPressed: toggleDetailsImage,
                    child: const Text(
                      'Details Image',
                      style: TextStyle(
                        color: Color(0xff6C563B),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color.fromARGB(108, 86, 59, 1),
                height: 1,
                thickness: 1.5,
              ),
              if (showDescription) ...[
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Text(
                        '2015 Honda CR-V EX-L',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Odometer - 52,315 miles',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Fuel Economy - 27.0/34.0 mpg City/Hwy',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Exterior Color - Blue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Interior Color - Gray',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Body - SUV',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Seating - 5 seats',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Transmission - Continuously Variable Automatic',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Drivetrain - Front-wheel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Engine - 2.4L I-4 cylinder',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (showDetailsImage) ...[
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Largest size:9145 x 5466 px (30.48 x 18.22 in.) - 300 dpi - RGB',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Craft photo ID:1150931120',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Upload date:May 24, 2019',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Location:Moldova',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                      Text(
                        'Categories: Craft Photos|Car',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F2023),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFFDCC7AD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Edit Online',
                style: TextStyle(
                  color: Color(0XFF6C563B),
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShoppingCart()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFFDCC7AD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  color: Color(0XFF6C563B),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
