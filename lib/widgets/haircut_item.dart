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
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                haircut.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
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
          Row(
            children: [
              const Icon(Icons.attach_money),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Text(haircut.price.toString()),
              )
            ],
          ),
        ],
      ),
    );
  }
}
