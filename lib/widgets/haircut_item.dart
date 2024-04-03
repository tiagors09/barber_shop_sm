import 'package:barber_shop_sm/models/order.dart';
import 'package:flutter/widgets.dart';

import '../models/haircut.dart';
import 'package:flutter/material.dart';

import 'haircut_form.dart';

class HaircutItem extends StatelessWidget {
  final Haircut haircut;
  final Function(Order) onAddOrder;

  const HaircutItem({
    super.key,
    required this.haircut,
    required this.onAddOrder,
  });

  _onTap(BuildContext ctx, Haircut haircut) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return HaircutForm(
          haircut: haircut,
        );
      },
    ).then((value) => onAddOrder(value));
  }

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(15);

    return InkWell(
      borderRadius: borderRadius,
      onTap: () => _onTap(context, haircut),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: 4,
        margin: const EdgeInsets.all(10),
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
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
      ),
    );
  }
}
