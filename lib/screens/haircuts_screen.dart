import 'package:barber_shop_sm/data/dummy_data.dart';
import 'package:barber_shop_sm/widgets/haircut_item.dart';
import 'package:flutter/material.dart';

class HaircutsScreen extends StatelessWidget {
  const HaircutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var haircuts = dummyData;

    return ListView.builder(
      itemCount: haircuts.length,
      itemBuilder: (ctx, i) => HaircutItem(haircut: haircuts[i]),
    );
  }
}
