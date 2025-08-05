import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/cart_page.dart';
import 'package:sanremo_food_delivery/favourites_screen.dart';
import 'package:sanremo_food_delivery/food_item_list_view.dart';
import 'package:sanremo_food_delivery/food_item_model_class.dart';
import 'package:sanremo_food_delivery/list_food_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Home, Favorites, Cart
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.pinkAccent),
                child: Text('Navigation Menu', style: TextStyle(color: Colors.white)),
              ),
              const ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorites'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FavouritesScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Cart'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartPage()),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
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
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                );
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            _HomeTab(),
            FavouritesScreen(),
            CartPage(),
          ],
        ),
        bottomNavigationBar: const TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.pinkAccent,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.favorite_border)),
            Tab(icon: Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}

class _HomeTab extends StatefulWidget {
  const _HomeTab();

  @override
  State<_HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<_HomeTab> {
  final TextEditingController _searchController = TextEditingController();
  List<FoodItem> filteredRestaurants = restaurantItemList;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.toLowerCase();

    if (query.isEmpty) {
      setState(() {
        filteredRestaurants = restaurantItemList;
      });
      return;
    }

    final matching = restaurantItemList
        .where((item) => item.itemName.toLowerCase().contains(query))
        .toList();

    final nonMatching = restaurantItemList
        .where((item) => !item.itemName.toLowerCase().contains(query))
        .toList();

    setState(() {
      filteredRestaurants = [...matching, ...nonMatching]; // matches on top
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for Restaurants',
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

            // 🍔 Food Items
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 120,
                child: FoodItemListView(foodItem: foodItemList),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "Top brands",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                height: 120,
                child: FoodItemListView(foodItem: brandList),
              ),
            ),

            // 🍽️ Explore Restaurants (Filtered)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Explore Restaurants",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(height: 500),
                child: ExploreResturantListView(exploreItem: filteredRestaurants),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

