import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink),
                child: Text('Navigation Menu',
                    style: TextStyle(color: Colors.white)),
              ),
              const ListTile(leading: Icon(Icons.home), title: Text('Home')),
              const ListTile(
                  leading: Icon(Icons.favorite), title: Text('Favorites')),
              ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartPage(),
                    ));
              },
                  ),
                  title: const Text('Cart')),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
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
                      builder: (_) => CartPage(),
                    ));
              },
              //empty cart page remaining  to navigate
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
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
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.grey,
          tabs: [
            const Tab(icon: Icon(Icons.home)),
            const Tab(icon: Icon(Icons.favorite_border)),
            Tab(
                icon: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartPage(),
                    ));
              },
            )),
          ],
        ),
      ),
    );
  }
}
