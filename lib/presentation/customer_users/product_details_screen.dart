import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  String name;
  String description;
  String imgUrl;
  ProductDetailScreen(
      {super.key,
      required this.name,
      required this.description,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Image.network(imgUrl),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Color.fromARGB(255, 26, 25, 25),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 26, 25, 25),
                fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: const TextStyle(
                height: 2,
                color: Color.fromARGB(255, 26, 25, 25),
                fontSize: 14),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 44, 52, 153),
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ]),
      ),
    );
  }
}
