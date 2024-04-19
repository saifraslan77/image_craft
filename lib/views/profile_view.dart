import 'package:flutter/material.dart';
import 'package:image_craft/views/shopping_cart.dart';
import 'camera_widget.dart';
import 'start_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key});

  Widget _buildGridView(int index) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 2,
        childAspectRatio: 2 / 3,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          child: Image.asset(
            'assets/${index + 1}.jpeg',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon.png',
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  'Youssefamin4050',
                  style: TextStyle(
                      color: Color(0xff6C563B),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Text(
              '0 followers . 0 following',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6C563B)),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              height: 25,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff987854)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CameraWidget()),
                  );
                },
                child: const Text(
                  'Edit image profile',
                  style: TextStyle(
                      fontSize: 12, color: Color(0xffFFFFFF), height: .4),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TabBar(
              tabs: [
                Tab(
                  icon: Image.asset('assets/Right-position.jpg'),
                ),
                Tab(icon: Image.asset('assets/download_3_line.jpg')),
                const Tab(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                    color: Color(0xff987854),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildGridView(1),
                  _buildGridView(2),
                  _buildGridView(3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
