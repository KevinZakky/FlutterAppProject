import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul2/app/modules/home/models/list_item.dart';
import 'package:modul2/app/modules/home/controllers/http_controller.dart';
import 'package:modul2/app/modules/home/views/profile_view.dart';

class ListProduct extends StatelessWidget {
  final HttpController httpController = Get.put(HttpController());

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<ListItem>>(
        future: httpController.fetchListItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available.'));
          } else {
            final items = snapshot.data!;

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return buildListItemCard(items[index]);
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
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

  Widget buildListItemCard(ListItem item) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Column(
        children: [
          Image.network(
            item.image,
            fit: BoxFit.cover,
            height: 300,
            width: 500,
          ),
          ListTile(
            title: Text(
              item.title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              item.description,
              style: TextStyle(fontSize: 14),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          ),
        ],
      ),
    );
  }
}
