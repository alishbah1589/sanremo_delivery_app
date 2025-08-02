import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});
  final String pandaImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjoXFkUGXm_SQ11jXtjcu8DDBS02SvQR7qhw&s";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.black,
            )),
        title: const Text(
          "Cart ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(pandaImage), fit: BoxFit.contain)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Hungry?",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("You haven't added anything to your cart!",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontStyle: FontStyle.italic)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Center(
                        child: Text(
                      "Browse",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.pink),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
