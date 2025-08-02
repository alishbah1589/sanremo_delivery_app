import 'package:flutter/material.dart';

class AddToCardItemsListTile extends StatefulWidget {
  const AddToCardItemsListTile({super.key});

  @override
  State<StatefulWidget> createState() => _AddtoCardItemsListTile();
}

class _AddtoCardItemsListTile extends State<AddToCardItemsListTile> {
  late double _newPrice;
  int _counter = 1;
  @override
  void initState() {
    //rougly add item price , calculation logic is remaining and added item in cart logic remaining
    // _newPrice = cart.itemPrice;
    _newPrice = 300;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      // _newPrice = _newPrice + cart.itemPrice;
      _newPrice = _newPrice + 300;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        //_newPrice = _newPrice - cart.itemPrice;
        _newPrice = _newPrice - 300;
      });
    } else {
      _counter = 0;
      _newPrice = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(16),
        borderOnForeground: false,
        elevation: 3,
        child: ListTile(
          minTileHeight: 70,
          leading: Container(
            height: 40,
            width: 50,
            color: Colors.pink,
          ), //rougly add container
          //  Image.asset(
          //   cart.productImage,
          //   fit: BoxFit.contain,
          //   width: 50,
          //   height: 40,
          // ),
          //image insert from add to cart list

          title: Text(
            "Fries",
            // cart.itemTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card.outlined(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: _decrementCounter,
                          icon: const Center(
                            child: Icon(
                              Icons.minimize_sharp,
                              size: 20,
                            ),
                          )),
                      Text(
                        '$_counter',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontSize: 20),
                      ),
                      IconButton(
                          onPressed: _incrementCounter,
                          icon: const Center(
                            child: Icon(
                              Icons.add,
                            ),
                          ))
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Rs.",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 16),
                    ),
                    Text(
                      "$_newPrice",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 16),
                    )
                  ],
                ),
              ]),
        ));
  }
}
