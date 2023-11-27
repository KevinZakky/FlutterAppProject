import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul2/app/modules/home/views/profile_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  List item = ["vegetables", "fruits", "meat", "rempah"];
  List<Color> bgColors = [
    Color.fromARGB(255, 248, 209, 186),
    Color.fromARGB(255, 181, 245, 195),
    Color.fromARGB(255, 236, 163, 161),
    Color.fromARGB(255, 51, 203, 241),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _navigateToProfilePage(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfileView(),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 0,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on_outlined),
          color: Colors.black,
          padding: const EdgeInsets.only(left: 15),
        ),
        title: const Text(
          "Sylhet, Bangladesh",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.0, top: 15, bottom: 15),
            child: GestureDetector(
                onTap: () {
                  _navigateToProfilePage(context);
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('lib/images/people.jpg'),
                  radius: 20,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(
                left: 23.0,
                bottom: 5,
              ),
              child: Text(
                "Good morning, Mate",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 120),
              child: Text(
                "Let's order fresh items for you",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 12),
              child: Text(
                "Categories",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: item.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 115,
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: bgColors[index],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "lib/images/${item[index]}.png",
                          height: 80,
                          width: 80,
                        ),
                        Container(
                          width: 110,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              item[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
              child: Text(
                "My Orders",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300, // Sesuaikan tinggi ListView sesuai kebutuhan
              child: ListView.builder(
                itemCount: item.length, // Ganti dengan jumlah pesanan Anda
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors
                          .transparent, // Ganti dengan warna latar belakang yang sesuai
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "lib/images/${item[index]}.png",
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(width: 10), // Spasi antara gambar dan teks
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black,
                                        height:
                                            1.2), // Sesuaikan dengan tinggi yang sesuai
                                  ),
                                  const Text(
                                    "\$25.00", // Harga item (ganti dengan harga sesuai)
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "20 jun, 2023", // Tanggal (ganti dengan tanggal sesuai)
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "1 items", // Jumlah item (ganti dengan jumlah sesuai)
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Get.toNamed('/home');
          } else if (index == 1) {
            Get.toNamed('/search');
          } else if (index == 2) {
            Get.toNamed('/item');
          } else if (index == 3) {
            Get.toNamed('/cart');
          }
        },
      ),
    );
  }
}
