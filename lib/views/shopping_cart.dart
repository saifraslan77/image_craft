import 'package:flutter/material.dart';

import 'car_view.dart';
import 'check_out.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key});

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
        title: const Text(
          'Shopping cart',
          style: TextStyle(
            color: Color(0xff6C563B),
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [
          Icon(
            Icons.add_shopping_cart,
            size: 30,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                buildItem('Brown Dog', 'assets/Brown Dog.jpeg', '\$82,755', context, 'Brown Dog'),
                const SizedBox(height: 20),
                buildItem('Fast Car', 'assets/fast car.jpeg', '\$82,755', context, 'Fast Car'),
                const SizedBox(height: 20),
                buildItem('Colorful Girl', 'assets/Colorful girl.jpeg', '\$82,755', context, 'Colorful Girl'),
                const SizedBox(height: 20),
                buildItem('Nature flower', 'assets/Nature flower.jpeg', '\$82,755', context, 'Nature flower'),
                const SizedBox(height: 20),
                buildItem('Conuropsis', 'assets/Conuropsis.jpeg', '\$82,755', context, 'Conuropsis'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 60,
                width: 350,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xff987854),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '\$82,755',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CheckOut()),
                          );
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Checkout',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_outlined,
                              size: 23,
                              color: Color(0xffFFFFFF),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(String title, String imagePath, String price, BuildContext context, String screenName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          // Navigate to the specified screen for each item
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenFactory.create(screenName)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(220, 199, 173, 0.8),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 75,
                  cacheWidth: 275,
                  cacheHeight: 206,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              IconButton(
                iconSize: 28,
                color: const Color(0xff000000),
                icon: const Icon(Icons.delete_outlined),
                onPressed: () {
                  // Add delete product function here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenFactory {
  static Widget create(String screenName) {
    switch (screenName) {
      case 'Brown Dog':
        return const CarView();
      case 'Fast Car':
        return const CarView();
      case 'Colorful Girl':
        return const CarView();
      case 'Nature flower':
        return const CarView();
      case 'Conuropsis':
        return const CarView();
      default:
        return Container();
    }
  }
}
