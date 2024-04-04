import 'package:barber_shop_sm/models/haircut.dart';

class Order {
  final String id;
  final Haircut haircut;
  final DateTime time;
  final double total;

  Order({
    required this.id,
    required this.haircut,
    required this.time,
    required this.total,
  });
}
