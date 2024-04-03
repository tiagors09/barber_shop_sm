import 'package:barber_shop_sm/models/haircut.dart';

class Order {
  final Haircut haircut;
  final DateTime time;
  final double total;

  Order({required this.haircut, required this.time, required this.total});
}
