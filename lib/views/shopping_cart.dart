import 'package:flutter/material.dart';
import '../models/auth_models/shopping_cart_models/cart_image_response.dart';
import 'car_view.dart';
import 'check_out.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<dynamic> cartItems = [];
  double totalPrice = 0.0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCartData();
  }

  Future<void> fetchCartData() async {
    try {
      String token = 'user_token'; // Replace with actual user token
      final response = await ShoppingCartRequest.fetchCartImages(token);
      if (mounted) {
        setState(() {
          final parsedResponse = ShoppingCartResponse.parseCartImagesResponse(response);
          cartItems = parsedResponse['items'];
          totalPrice = parsedResponse['totalPrice'];
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        _showSnackBar("Failed to load cart items");
      }
    }
  }

  Future<void> addToCart(String imageId) async {
    try {
      String token = 'user_token';
      await ShoppingCartRequest.addToCart(token, imageId);
      fetchCartData(); // Refresh cart data after adding
    } catch (e) {
      _showSnackBar(e.toString());
    }
  }

  Future<void> deleteImage(String imageId) async {
    try {
      String token = 'user_token';
      await ShoppingCartRequest.deleteImageFromCart(token, imageId);
      fetchCartData(); // Refresh cart data after deleting
    } catch (e) {
      _showSnackBar(e.toString());
    }
  }

  Future<void> deleteCart() async {
    try {
      String token = 'user_token';
      await ShoppingCartRequest.deleteCart(token);
      fetchCartData(); // Refresh cart data after deleting cart
    } catch (e) {
      _showSnackBar(e.toString());
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6C563B)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            'Shopping Cart',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 21,
              fontWeight: FontWeight.w500,
              height: 1,
              letterSpacing: -0.01,
              color: Color(0xFF6C563B),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
            iconSize: 33.33,
            color: const Color(0xFF6C563B),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return buildItem(
                  item['title'],
                  item['imagePath'],
                  item['price'].toString(),
                  context,
                  item['screenName'],
                  item['id'],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xff987854),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
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
        ],
      ),
    );
  }

  Widget buildItem(String title, String imagePath, String price, BuildContext context, String screenName, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
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
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imagePath,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.1875,
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
                  deleteImage(id);
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
      case 'Fast Car':
      case 'Colorful Girl':
      case 'Nature flower':
      case 'Conuropsis':
        return const CarView();
      default:
        return Container();
    }
  }
}