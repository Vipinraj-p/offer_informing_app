import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String imageUrl, description, name;
  const ProductTile({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
              color: const Color.fromARGB(14, 0, 0, 0),
              borderRadius: BorderRadius.circular(7)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 137,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(imageUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: size.width * 0.4,
                  height: 300,
                  child: Column(
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 26, 25, 25),
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        description,
                        maxLines: 5, softWrap: true,
                        // overflow: TextOverflow.clip,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 26, 25, 25),
                            fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        )
      ],
    );
  }
}
