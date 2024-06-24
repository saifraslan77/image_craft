import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shopping_cart_cubit/addToCart/cubit/add_to_cart_cubit.dart';
import '../shopping_cart_cubit/deleteCart/cubit/delete_cart_cubit.dart';
import '../shopping_cart_cubit/deleteImageFromCart/cubit/delete_image_from_cart_cubit.dart';
import '../shopping_cart_cubit/fetchCartImages/cubit/fetch_cart_images_cubit.dart';
import 'car_view.dart';
import 'check_out.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

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
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FetchCartImagesCubit()..fetchCartImages()),
          BlocProvider(create: (context) => AddToCartCubit()),
          BlocProvider(create: (context) => DeleteCartCubit()),
          BlocProvider(create: (context) => DeleteImageFromCartCubit()),
        ],
        child: const _CartItemList(),
      ),
    );
  }
}

class _CartItemList extends StatelessWidget {
  const _CartItemList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCartImagesCubit, FetchCartImagesState>(
      builder: (context, state) {
        if (state is FetchCartImagesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchCartImagesSuccess) {
          final cartItems = state.response.images;
          final totalPrice = state.response.totalPrice;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return _buildItem(
                      item.imageName ?? '',
                      item.imagePath ?? '',
                      item.price.toString(),
                      context,
                      'CarView',
                      item.id.toString(),
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
                          '\$${totalPrice?.toStringAsFixed(2)}',
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
          );
        } else if (state is FetchCartImagesFailure) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }

  Widget _buildItem(
      String title,
      String imagePath,
      String price,
      BuildContext context,
      String screenName,
      String id,
      ) {
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
                  context.read<DeleteImageFromCartCubit>().deleteImageFromCart(id);
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
      case 'CarView':
        return const CarView();
      default:
        return Container();
    }
  }
}
