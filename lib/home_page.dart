import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/cart_page.dart';
import 'package:sanremo_food_delivery/food_item_list_view.dart';
import 'package:sanremo_food_delivery/list_food_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.pinkAccent),
                child: Text('Navigation Menu',
                    style: TextStyle(color: Colors.white)),
              ),
              const ListTile(leading: Icon(Icons.home), title: Text('Home')),
              const ListTile(
                  leading: Icon(Icons.favorite), title: Text('Favorites')),
              ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CartPage(),
                          ));
                    },
                  ),
                  title: const Text('Cart')),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const Row(
            children: [
              Icon(Icons.location_on, color: Colors.white),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Lahore, Pakistan',
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon:
                  const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartPage(),
                    ));
              },
              //empty cart page remaining  to navigate
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for food...',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      height: 120,
                      child: FoodItemListView(foodItem: foodItemList)),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      "Top brands",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                      height: 120,
                      child: FoodItemListView(foodItem: brandList)),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      "Explore Restaurants",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: ConstrainedBox(
                      constraints: const BoxConstraints.expand(height: 500),
                      child: ExploreResturantListView(
                          exploreItem: restaurantItemList)),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.pinkAccent,
          unselectedLabelColor: Colors.grey,
          tabs: [
            const Tab(icon: Icon(Icons.home)),
            const Tab(icon: Icon(Icons.favorite_border)),
            Tab(
                icon: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartPage(),
                    ));
              },
            )),
          ],
        ),
      ),
    );
  }
}
