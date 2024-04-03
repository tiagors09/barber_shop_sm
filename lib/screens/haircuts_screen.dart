import 'package:barber_shop_sm/data/dummy_data.dart';
import 'package:barber_shop_sm/models/order.dart';
import 'package:barber_shop_sm/widgets/haircut_item.dart';
import 'package:flutter/material.dart';

class HaircutsScreen extends StatelessWidget {
  final Function(Order) onAddOrder;

  const HaircutsScreen({
    super.key,
    required this.onAddOrder,
  });

  @override
  Widget build(BuildContext context) {
    var haircuts = dummyData;

    return GridView.builder(
      itemCount: haircuts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
        mainAxisExtent: 310,
      ),
      itemBuilder: (ctx, i) => HaircutItem(
        haircut: haircuts[i],
        onAddOrder: onAddOrder,
      ),
    );
  }
}
