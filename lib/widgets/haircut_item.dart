import 'package:flutter/widgets.dart';

import '../models/haircut.dart';
import 'package:flutter/material.dart';

class HaircutItem extends StatelessWidget {
  final Haircut haircut;

  const HaircutItem({
    super.key,
    required this.haircut,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  haircut.imageUrl,
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black38,
                  child: Text(
                    haircut.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.attach_money),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Text(haircut.price.toString()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
