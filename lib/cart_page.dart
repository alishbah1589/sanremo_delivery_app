import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/components.dart';
import 'package:sanremo_food_delivery/home_page.dart';
import 'package:sanremo_food_delivery/mycode.dart';
import 'add_to_cart_list_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Cart cart = Cart(); selected item in cart ,  list add
  String offToggle = "No cutlrey provided!Thanks for reducing waste";
  bool light = false;
  double subTotal = 300.00;
  double standardDelivery = 49.00;
  double platformFee = 7.99;
  double smallOrderFee = 34.00;
  late double totalAmount;
  String riderImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmrEwMyMYa_wNA__XddNazvRkPrXTx33ckXS-PpNHABGoNJ-WeQOkNK3n-I3qEB341Y04&usqp=CAU";
  @override
  void initState() {
    super.initState();
    _totalAmountCal();
  }

  void _totalAmountCal() {
    setState(() {
      totalAmount = subTotal + standardDelivery + platformFee + smallOrderFee;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            primary: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ));
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.black,
                )),
            title: const Text(
              "Cart ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card.outlined(
                  elevation: 10,
                  child: ListTile(
                    minTileHeight: 40,
                    leading: Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(riderImage),
                              fit: BoxFit.contain)),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    title: Text(
                      "Estimated Delivery",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w200, fontSize: 12),
                    ),
                    subtitle: Text("Standard (10-25 mins)",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w800, fontSize: 18)),
                  )),
            ),
            const AddToCardItemsListTile(),
            const AddToCardItemsListTile(),

            // SliverList.builder(
            //   itemBuilder: (context, index) => AddToCardItemsListTile(),
            // )
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card.outlined(
                borderOnForeground: false,
                elevation: 5,
                child: ListBody(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Subtotal ",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w800, fontSize: 20),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Text("Rs.",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20)),
                          Text("$subTotal",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text("Standard Delivery",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14)),
                          const Spacer(
                            flex: 2,
                          ),
                          Text("Rs.",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14)),
                          Text("$standardDelivery",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text("Small order fee",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14)),
                          const Spacer(
                            flex: 2,
                          ),
                          Text("Rs.",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14)),
                          Text("$smallOrderFee",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text("Platform Fee",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14)),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.pink,
                                  content: Text(
                                      "This help us improve product features, experience & manage operational costs",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16))));
                            },
                            icon: const Icon(Icons.info_outline),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Text("Rs.",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14)),
                          Text("$platformFee",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card.outlined(
                elevation: 5,
                borderOnForeground: false,
                child: ListTile(
                  leading: const Icon(
                    Icons.food_bank_outlined,
                  ),
                  title: Text(
                    "Cutlery",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  subtitle: Text(offToggle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w200, fontSize: 14)),
                  trailing: Switch(
                    value: light,
                    activeColor: Colors.pink,
                    onChanged: (bool value) {
                      setState(() {
                        light = value;
                        if (light) {
                          offToggle =
                              "If avaiable , your order will come with cutlery";
                        } else {
                          offToggle =
                              "No cutlery is provided! Thanks for reducing waste";
                        }
                      });
                    },
                  ),
                ),
              ),
            )
          ]))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 30,
        surfaceTintColor: const Color.fromARGB(255, 79, 73, 73),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Text(
                    "Total ",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Text(
                    "(incl. fees and tax)",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w200, fontSize: 12),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Rs.",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Text(
                    totalAmount.toStringAsFixed(2),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: 250,
                child: roundedButton(
                    text: "Confirm payment and address",
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> MyPart()));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
