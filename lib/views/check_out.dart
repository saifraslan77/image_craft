import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 18,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/flutter-project.png',
          height: 21.3,
          width: 140.6,
          alignment: Alignment.bottomCenter,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6C563B),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Image.asset(
                      'assets/Group 869.png',
                      height: 65,
                      width: 220,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Row(
                      children: [
                        IconButton(
                          iconSize: 17,
                          color: const Color(0xff987854),
                          onPressed: () {},
                          icon: Row(
                            children: [
                              Image.asset('assets/ri_qr-scan-2-line.png'),
                              const SizedBox(width: 4),
                              const Text(
                                'Scan Card',
                                style: TextStyle(
                                  color: Color(0xff987854),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 6), // تحديد التباعد على اليسار
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Name on card',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff6C563B),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Container(
                                width: 398,
                                height: 46,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(220, 199, 173, 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    textDirection: TextDirection.ltr,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'NAME',
                                      labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff987854),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xffDCC7ADCC),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Card Number',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff6C563B),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 398,
                              height: 46,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(220, 199, 173, 0.8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'xxxx xxxx xxxx xxxx',
                                    labelStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff987854),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: Color(0xffDCC7ADCC),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Expiry Date',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff6C563B),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Container(
                                    width: 189.27,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          220, 199, 173, 0.8),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'MM/YY',
                                          labelStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff987854),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: Color(0xffDCC7ADCC),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Security code',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff6C563B),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Container(
                                    width: 189.27,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          220, 199, 173, 0.8),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'CVV',
                                          labelStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff987854),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: Color(0xffDCC7ADCC),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ZIP/Postal Code',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff6C563B),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 389,
                              height: 46,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(220, 199, 173, 0.8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'xxxxx',
                                    labelStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff987854),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: Color(0xffDCC7ADCC),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 55),
                    SizedBox(
                      width: 389,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          // Your action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color.fromRGBO(152, 120, 84, 1),
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Done',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff6C563B)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
